require_relative 'parsing_utils'

module Converter
  module Testfile
    class PhraseReplacer
      def initialize(lines, label)
        @label = label
        @lines = lines
      end

      def go
        @lines = LoginReplacer.new(:login, @lines).lines
        @lines = LogoutReplacer.new(@lines).lines
        @lines = SubmitReplacer.new(:submit, @lines).lines
        @lines = AutoCompleteReplacer.new(:auto_complete, @lines).lines
        @lines = PreferredTitleLocator.new(:preferred_title, @lines).lines
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
    # Replace a login sequence with a call to vivo_login_as(email, password)
    #
    # The login sequence must start with
    #       <tr><td>clickAndWait</td><td>link=Log in</td><td></td></tr>
    # It might optionally be preceded by
    #       <tr><td>assertTitle</td><td>VIVO</td><td></td></tr>
    #    (with any title), which might be preceded by
    #       <tr><td>open</td><td>/vivo/</td><td></td></tr>
    # It must be followed by these
    #       <tr><td>type</td><td>loginName</td><td>testAdmin@cornell.edu</td></tr>
    #          or the field might be specified as "id=loginName"
    #       <tr><td>type</td><td>loginPassword</td><td>Password</td></tr>
    #          or the field might be specified as "id=loginPassword"
    #       <tr><td>clickAndWait</td><td>name=loginForm</td><td></td></tr>
    #
    # If all of these are satisfied, replace it with
    #        vivo_login_as(email, password)
    #
    class LoginReplacer < AbstractPhraseReplacer
      def find_replacements_for_range_based_at_current_index
        if is_click_on_login &&
        maybe_back_up_for_clicking_the_link &&
        maybe_back_up_for_open &&
        next_is_login_page &&
        next_is_enter_login_name &&
        next_is_enter_password &&
        next_is_submit_form
          figure_replacements
        else
          nil
        end
      end

      def is_click_on_login
        @line.match?("clickAndWait", "link=Log in")
      end

      def maybe_back_up_for_clicking_the_link
        look_for_optional_backup("assertTitle", "VIVO")
      end

      def maybe_back_up_for_open
        look_for_optional_backup("open", "/vivo/")
      end

      def next_is_login_page
        advance_to_next_line
        @line.match?("assertTitle", "Log in to VIVO")
      end

      def next_is_enter_login_name
        advance_to_next_line
        if m = @line.match("type", "loginName") || @line.match("type", "id=loginName")
          @login_name = m[2][0]
        else
          nil
        end
      end

      def next_is_enter_password
        advance_to_next_line
        if m = @line.match("type", "loginPassword") || @line.match("type", "id=loginPassword")
          @password = m[2][0]
        else
          nil
        end
      end

      def next_is_submit_form
        advance_to_next_line
        @line.match?("clickAndWait", "loginForm") ||
        @line.match?("clickAndWait", "name=loginForm")
      end

      def figure_replacements
        @replacements = comments_from_range
        @replacements << Line.new("vivo_login_as(\"%s\", \"%s\")" % [ @login_name, @password ])
      end

      def look_for_optional_backup(target1, target2 = /.*/, target3 = /.*/)
        (@first_index - 1).downto(0) do |index|
          line = @lines[index]
          if line.match?(target1, target2, target3)
            @first_index = index
            return true
          elsif line.comment
            # keep looking
          else
            return true
          end
        end
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
