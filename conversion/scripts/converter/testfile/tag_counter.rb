module Converter
  module Testfile
    class TagCounter
      def initialize(contents)
        @tags = contents.split("\n").keep_if { |line| line.match? /^\s*#<tr>/ }
      end

      def tags
        @tags
      end
    end
  end
end
