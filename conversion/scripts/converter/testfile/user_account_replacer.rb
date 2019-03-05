#
# The new tests will use user accounts with email addresses at somewhere other than Cornell.
#
module Converter
  module Testfile
    class UserAccountReplacer < AbstractParsedLinesReplacer
      def replacement
        replace_login_name || replace_rick_rookie
      end
      
      def replace_login_name
        @line.match(/^type$/, /loginName$/, /^(.*)@cornell.edu$/) do
          Line.new(@line.text.gsub(/cornell\.edu/, "mydomain.edu"))
        end
      end
      
      def replace_rick_rookie
        @line.text.match(/RickRookie@cornell.edu/) do
          Line.new(@line.text.gsub(/cornell\.edu/, "mydomain.edu"))
        end
      end
    end
  end
end
