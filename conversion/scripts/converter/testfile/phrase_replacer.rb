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
  end
end

=begin
#<tr><td>type</td><td>id=object</td><td></td></tr>
#<tr><td>sendKeys</td><td>id=object</td><td>United State</td></tr>
#<tr><td>pause</td><td>5000</td><td></td></tr>
#<tr><td>sendKeys</td><td>id=object</td><td>${KEY_DOWN}</td></tr>

=end