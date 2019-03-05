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
        @lines = SubmitReplacer.new(:submit, @lines).lines
        @lines = AutoCompleteReplacer.new(:auto_complete, @lines).lines
        @lines = PreferredTitleLocator.new(:preferred_title, @lines).lines
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
    # Work your way through the lines; loop based on @lines.size, so we will
    # adjust properly if the array expands or contracts.
    #
    # Call find_replacements_for_range_based_at_current_index,having set values
    # for @lines, @index, @first_index, @next_index, @line and @replacements.
    #
    # If a match exists based at the current index, adjust @first_index,
    # @next_index and @replacements accordingly.
    #
    # Replace the lines. Advance the index and repeat until we reach the end of
    # the lines.
    #
    class AbstractPhraseReplacer
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
          @next_index = 1 + @first_index = @index = index
          @line = @lines[@index]
          @replacements = nil

          find_replacements_for_range_based_at_current_index

          if @replacements
            @lines = @lines[0...@first_index].concat(@replacements).concat(@lines[@next_index..-1])
            $reporter.replace_phrase(@key, @replacements.size)
          end
          index += 1
        end
      end

      def advance_to_next_line
        (@next_index...@lines.size).each do |index|
          @next_index = 1 + @index = index
          @line = @lines[@index]
          return @line unless @line.comment
        end
        nil
      end

      def lines
        @lines
      end

      def comments_from_range
        @lines[@first_index...@next_index].select { |l| l.comment }
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
    class SubmitReplacer < AbstractPhraseReplacer
      def find_replacements_for_range_based_at_current_index
        if is_assert_title_edit &&
        encounters_submit_before_another_assert_title &&
        goes_immediately_to_new_page
          figure_replacements
        else
          nil
        end
      end

      def is_assert_title_edit
        @line.match?("assertTitle", "Edit")
      end

      def encounters_submit_before_another_assert_title
        while advance_to_next_line do
          if @line.match?("assertTitle")
            return nil
          elsif m =
          @line.match("clickAndWait", "submit") ||
          @line.match("clickAndWait", "id=submit") ||
          @line.match("clickAndWait", "css=input.submit")
            @submit_spec = element_spec(@line.field2)
            return @submit_index = @index
          end
        end
        nil
      end

      def goes_immediately_to_new_page
        advance_to_next_line
        @line.match?("assertTitle")
      end

      def figure_replacements
        @next_index = @index = @submit_index + 1
        @replacements = @lines[@first_index...@submit_index]
        @replacements << Line.new("vivo_click_and_wait_for_indexing(%s)" % [ @submit_spec ])
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
    class AutoCompleteReplacer < AbstractPhraseReplacer
      def find_replacements_for_range_based_at_current_index
        if is_empty_type_command &&
        next_is_send_keys_to_same_field &&
        next_is_pause &&
        next_is_key_down_to_same_field &&
        next_is_click_active_item
          figure_replacements
        else
          nil
        end
      end

      def is_empty_type_command
        @line.match("type", /.*/, "") do |m|
          @raw_element_spec = m[1][0]
        end
      end

      def next_is_send_keys_to_same_field
        advance_to_next_line
        @line.match("sendKeys", @raw_element_spec) do |m|
          @raw_text = m[2][0]
        end
      end

      def next_is_pause
        advance_to_next_line
        @line.match?("pause")
      end

      def next_is_key_down_to_same_field
        advance_to_next_line
        @line.match?("sendKeys", @raw_element_spec, "${KEY_DOWN}")
      end

      def next_is_click_active_item
        advance_to_next_line
        @line.match("click") do |m|
          # matches either form of the raw spec
          element_spec(m[1][0]) == ':id, "ui-active-menuitem"'
        end
      end

      def figure_replacements
        good_spec = element_spec(@raw_element_spec)
        good_text = value(@raw_text)

        @replacements = comments_from_range
        @replacements << Line.new("$browser.find_element(%s).send_keys(\"%s\")" % [ good_spec, good_text ])
        @replacements << Line.new("browser_wait_for_jQuery")
        @replacements << Line.new("$browser.find_element(%s).send_keys(:arrow_down, :return)" % [ good_spec ])
      end
    end

    #
    # The old way of locating the "add preferred title" link, no longer works.
    #
    # If you find this sequence:
    #   <tr><td>clickAndWait</td><td>css=header &gt; #ARG_2000028 &gt; a.add-ARG_2000028 &gt; img.add-individual</td><td></td></tr>
    #   <tr><td>assertTitle</td><td>Edit</td><td></td></tr>
    #   <tr><td>type</td><td>id=preferredTitle</td><td>Assistant Professor</td></tr>
    # Replace the first line with this one:
    #   <tr><td>clickAndWait</td><td>css=[title="Add new preferred title entry"]</td><td></td></tr>
    # Then let the usual "clickAndWait" replacer do it's work.
    #
    class PreferredTitleLocator < AbstractPhraseReplacer
      def find_replacements_for_range_based_at_current_index
        if is_funky_click_and_wait &&
        next_is_edit_page &&
        next_is_type_in_preferred_title
          figure_replacements
        else
          nil
        end
      end

      def is_funky_click_and_wait
        @line.match?("clickAndWait", "css=header &gt; #ARG_2000028 &gt; a.add-ARG_2000028 &gt; img.add-individual") 
      end

      def next_is_edit_page
        advance_to_next_line
        @line.match("assertTitle", "Edit")
      end

      def next_is_type_in_preferred_title
        advance_to_next_line
        @line.match?("type", "id=preferredTitle")
      end

      def figure_replacements
        @next_index = @first_index + 1
        @replacements = [ Line.new("#<tr><td>clickAndWait</td><td>css=[title=\"Add new preferred title entry\"]</td><td></td></tr>") ]
      end
    end
  end
end
