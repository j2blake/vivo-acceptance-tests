#
# The skeleton for a class that looks at each line one at a time and decides 
# whether to keep it, or to replace it with one or more new lines.
#
# Subclass must implement 'replacement' which inspects @line and returns either 
# nil or a Line, or an array of Lines.
#
module Converter
  module Testfile
    class AbstractParsedLinesReplacer
      def initialize(parsed)
        @parsed = parsed
      end

      def go
        @result = []

        @parsed.each do |line|
          @line = line
          @result.concat([ *(replacement || @line) ])
        end

        @result
      end

    end
  end
end
