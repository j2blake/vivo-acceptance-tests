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
        puts "finding submit_line"
        ((@first_index + 1)...@lines.size).each do |index|
          line = @lines[index]
          if line.match(/^assertTitle$/)
            return nil
          elsif line.match(/^clickAndWait$/)
            puts "field2 '#{line.field2}'"
            if ["submit", "id=submit", "css=input.submit"].include?(line.field2)
              @submit_spec = element_spec(line.field2)
              return @submit_index = index
            end
          end
        end
        nil
      end

      def goes_immediately_to_new_page
        puts "check new page"
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
  end
end

=begin
#<tr><td>type</td><td>id=object</td><td></td></tr>
#<tr><td>sendKeys</td><td>id=object</td><td>United State</td></tr>
#<tr><td>pause</td><td>5000</td><td></td></tr>
#<tr><td>sendKeys</td><td>id=object</td><td>${KEY_DOWN}</td></tr>

=end