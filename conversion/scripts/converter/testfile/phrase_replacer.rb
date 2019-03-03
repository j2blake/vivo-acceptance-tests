require_relative 'parsing_utils'

module Converter
  module Testfile
    class PhraseReplacer
      def initialize(lines, label)
        @label = label
        @lines = lines
      end

      def go
        @lines = LoginReplacer.new(@lines).lines
        @lines = LogoutReplacer.new(@lines).lines
        @lines = SubmitReplacer.new(@lines).lines
        @lines = AutoCompleteReplacer.new(:auto_complete, @lines).lines
        @lines
      end
    end

    class LoginReplacer
      def initialize(lines)
        @lines = lines

        while
          find_first_line &&
          find_matching_last_line &&
          validate_range &&
          extend_beginning &&
          find_login_name &&
          find_password do
          replace
        end
      end

      def find_first_line
        @first_index = @lines.find_index { |line| line.match(/^clickAndWait$/, /^link=Log in$/) }
      end

      def find_matching_last_line
        found = @lines[@first_index..-1].find_index { |line| line.match(/^clickAndWait$/, /^loginForm$/) }
        @last_index = found ? found + @first_index : nil
      end

      def validate_range
        @lines[(@first_index + 1)..(@last_index - 1)].each do |line|
          return nil unless
          line.comment ||
          line.match(/^assertTitle$/) ||
          line.match(/^open$/, %r{^/vivo/$}) ||
          line.match(/^type$/, /^loginName$/) ||
          line.match(/^type$/, /^loginPassword$/) ||
          line.match(/^verifyTextPresent$/, /^Log in$/)
        end
        true
      end

      def extend_beginning
        while @lines[@first_index - 1].comment ||
          @lines[@first_index - 1].match(/^open$/, %r{^/vivo/$}) ||
          @lines[@first_index - 1].match(/^assertTitle$/, /^VIVO$/)
          @first_index -= 1
        end
        true
      end

      def find_login_name
        @lines[@first_index..@last_index].each do |line|
          line.match(/^type$/, /^loginName$/) do |m|
            return @login_name = m[2][0]
          end
        end
        nil
      end

      def find_password
        @lines[@first_index..@last_index].each do |line|
          line.match(/^type$/, /^loginPassword$/) do |m|
            return @password = m[2][0]
          end
        end
        nil
      end

      def replace
        replacement = Line.new("vivo_login_as(\"#{@login_name}\", \"#{@password}\")")
        comments = @lines[@first_index..@last_index].select { |l| l.comment }

        @lines = @lines[0..(@first_index - 1)].concat(comments).append(replacement).concat(@lines[(@last_index + 1)..-1])
        $reporter.replace_phrase(:login, @last_index + 1 - @first_index - comments.size)
      end

      def lines
        @lines
      end
    end

    class LogoutReplacer
      def initialize(lines)
        @lines = lines

        while
          find_logout_line &&
          replace
        end
      end

      def find_logout_line
        @index = @lines.find_index { |line| line.match(/^clickAndWait$/, /^link=Log out$/) }
      end

      def replace
        replacement = Line.new("vivo_logout")

        @lines = @lines[0..(@index - 1)].append(replacement).concat(@lines[(@index + 1)..-1])
        $reporter.replace_phrase(:logout, 1)
      end

      def lines
        @lines
      end
    end

    #
    # When do we need to wait for indexing? Usually when clicking the submit on an editing
    # form.
    #
    # So, if we see
    # 1) We go to an editing form:
    #       <tr><td>assertTitle</td><td>Edit</td><td></td></tr>
    # 2) We do some stuff
    #       ...Anything that doesn't include an "assertTitle"...
    # 3) We click the "submit" button
    #       #<tr><td>clickAndWait</td><td>id=submit</td><td></td></tr>
    # 4) And it takes us to another page
    #       #<tr><td>assertTitle</td><td>...anything...</td><td></td></tr>
    # Then,
    #  1) Replace the submit button with a call to vivo_click_and_wait_for_indexing
    #
    class SubmitReplacer
      include ParsingUtils
      #
      def initialize(lines)
        @lines = lines

        @lines.each_index do |index|
          if is_first_line(index) && find_submit_line && goes_immediately_to_new_page
            replace
          end
        end
      end

      def is_first_line(index)
        @lines[index].match(/^assertTitle$/, /^Edit$/) do
          @first_index = index
        end
      end

      def find_submit_line
        ((@first_index + 1)...@lines.size).each do |index|
          line = @lines[index]
          if line.match(/^assertTitle$/)
            return nil
          elsif line.match(/^clickAndWait$/)
            if ["submit", "id=submit", "css=input.submit"].include?(line.field2)
              @submit_spec = element_spec(line.field2)
              return @submit_index = index
            end
          end
        end
        nil
      end

      def goes_immediately_to_new_page
        @lines[@submit_index + 1].match(/^assertTitle$/)
      end

      def replace
        "replace"
        replacement = Line.new("vivo_logout")
        @lines[@submit_index] = Line.new("vivo_click_and_wait_for_indexing(%s)" % [ @submit_spec ])
        $reporter.replace_phrase(:submit, 1)
      end

      def lines
        @lines
      end
    end

    #
    # Work your way through the lines; loop based on @lines.size, so we will
    # adjust properly if the array expands or contracts.
    #
    # Call check_for_match, passing the array of lines and the current index.
    # If a match exists based on the current index, return first_index,
    # last_index, and an array of replacement lines.
    #
    # Replace the lines. Advance the index to the end of the replaced lines.
    # Repeat until we reach the end of the lines.
    #
    class BasePhraseReplacer
      include ParsingUtils
      #
      def initialize(key, lines)
        @key = key
        @lines = lines
        iterate
      end

      def iterate
        index = 0
        while index < @lines.size
          first_index, past_index, replacements = locate_range_on_line(index)
          if first_index
            @lines = @lines[0...first_index].concat(replacements).concat(@lines[past_index..-1])
            $reporter.replace_phrase(@key, replacements.size)
          end
          index += 1
        end
      end

      def lines
        @lines
      end

      def pull_comments(some_lines)
        some_lines.select { |line| line.comment }
      end
    end

    #
    # What does it look like when we use the auto-complete feature?
    #
    # In most cases, it's
    # 1) Type zero characters into a fields
    #       <tr><td>type</td><td>id=object</td><td></td></tr>
    # 2) Send some keys to that same field
    #       <tr><td>sendKeys</td><td>id=object</td><td>Primate His</td></tr>
    # 3) Pause for 5 seconds
    #       <tr><td>pause</td><td>5000</td><td></td></tr>
    # 4) Send the KEY_DOWN key to that same field
    #       <tr><td>sendKeys</td><td>id=object</td><td>${KEY_DOWN}</td></tr>
    # 5) Click on the active menu item
    #       <tr><td>click</td><td>id=ui-active-menuitem</td><td></td></tr>
    #    or
    #       <tr><td>click</td><td>ui-active-menuitem</td><td></td></tr>
    # This should become:
    # 1) Send keys to the field
    # 2) Wait for jquery to complete
    # 3) Send :down_arrow and :return to that field
    #
    class AutoCompleteReplacer < BasePhraseReplacer
      def locate_range_on_line(index)
        if is_empty_type_command(index) &&
        skip_comments &&
        is_send_keys_to_same_field &&
        skip_comments &&
        is_pause &&
        skip_comments &&
        is_key_down &&
        skip_comments &&
        is_click_active_item
          return @first_index, @past_index, replace_lines
        else
          nil
        end
      end

      def is_empty_type_command(index)
        @lines[index].match(/^type$/, /.*/, /^$/) do |m|
          @past_index = 1 + @first_index = index
          @raw_spec = m[1][0]
          true
        end
      end

      def skip_comments
        (@past_index...@lines.size).each do |index|
          unless @lines[index].comment
            return @past_index = index
          end
        end
      end

      def is_send_keys_to_same_field
        line = @lines[@past_index]
        if line.field1 == "sendKeys"
          if @raw_spec == line.field2
            @text = value(line.field3)
            @past_index += 1
          else
            nil
          end
        else
          nil
        end
      end

      def is_pause
        @lines[@past_index].match(/^pause$/) do
          @past_index += 1
        end
      end

      def is_key_down
        @lines[@past_index].match(/^sendKeys$/, /.*/, /^\${KEY_DOWN}$/) do |m|
          if @raw_spec == m[1][0]
            @past_index += 1
          else
            nil
          end
        end
      end

      def is_click_active_item
        @lines[@past_index].match(/^click$/) do |m|
          if (element_spec(m[1][0]) == ':id, "ui-active-menuitem"')
            @past_index += 1
          else
            nil
          end
        end
      end

      def replace_lines
        replacement = pull_comments(@lines[@first_index...@past_index])
        replacement << Line.new("$browser.find_element(%s).send_keys(\"%s\")" % [ element_spec(@raw_spec), @text ])
        replacement << Line.new("browser_wait_for_jQuery")
        replacement << Line.new("$browser.find_element(%s).send_keys(:arrow_down, :return)" % [ element_spec(@raw_spec) ])
      end
    end

  end
end
