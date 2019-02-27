module Converter
  module Testfile
    class PhraseReplacer
      def initialize(contents, label)
        @label = label
        @lines = contents.split("\n")
        @lines = LoginReplacer.new(@lines).lines
        @lines = LogoutReplacer.new(@lines).lines
      end

      def to_s
        @lines.join("\n")
      end
    end

    class LoginReplacer
      def initialize(lines)
        @lines = lines

        find_first_line &&
        find_matching_last_line &&
        validate_range &&
        extend_beginning &&
        find_login_name &&
        find_password &&
        replace
      end

      def find_first_line
        @first_index = @lines.find_index { |line| line.match? %r{<td>clickAndWait</td><td>link=Log in</td>} }
      end

      def find_matching_last_line
        found = @lines[@first_index..-1].find_index { |line| line.match? %r{<td>clickAndWait</td><td>loginForm</td>} }
        @last_index = found ? found + @first_index : nil
      end

      def validate_range
        @lines[(@first_index + 1)..(@last_index - 1)].each do |line|
          return nil unless
          line.match?(%r{<!--.+-->}) ||
          line.match?(%r{<td>assertTitle</td>}) ||
          line.match?(%r{<td>open</td><td>/vivo/</td>}) ||
          line.match?(%r{<td>type</td><td>loginName</td>}) ||
          line.match?(%r{<td>type</td><td>loginPassword</td>})
        end
        true
      end

      def extend_beginning
        while @lines[@first_index - 1].match?(%r{<!--.+-->}) ||
          @lines[@first_index - 1].match?(%r{<td>open</td><td>/vivo/</td>}) ||
          @lines[@first_index - 1].match?(%r{<td>assertTitle</td><td>VIVO</td>})
          @first_index -= 1
        end
        true
      end

      def find_login_name
        @lines[@first_index..@last_index].join(" ").match(%r{<td>type</td><td>loginName</td><td>(.*?)</td>}) do |m|
          @login_name = m[1]
        end
      end

      def find_password
        @lines[@first_index..@last_index].join(" ").match(%r{<td>type</td><td>loginPassword</td><td>(.*?)</td>}) do |m|
          @password = m[1]
        end
      end

      def replace
        replacement = "vivo_login_as(\"#{@login_name}\", \"#{@password}\")"
        comments = @lines[@first_index..@last_index].select { |l| l.match?(%r{<!--.+-->}) }
          
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
        if start_line = find_start
          if end_line = find_end
            if lines_are_valid
              replace_range
            end
          end
        end
      end

      def find_start
      end

      def find_end
      end

      def lines_are_valid
      end

      def replace_range
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