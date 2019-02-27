#
# The new tests will use user accounts with email addresses at somewhere other than Cornell.
#
module Converter
  module Testfile
    class UserAccountReplacer < AbstractParsedLinesReplacer
      def replacement
        @line.match(/^type$/, /^loginName$/, /^(.*)@cornell.edu$/) do
          Line.new(@line.text.gsub(/cornell\.edu/, "mydomain.edu"))
        end
      end
    end
  end
end
