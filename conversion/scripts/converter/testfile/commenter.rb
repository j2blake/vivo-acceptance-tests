module Converter
  module Testfile
    class Commenter
      def initialize(contents)
        @contents = contents
        @contents = contents.each_line.map {|l| "#" + l}.join("")
      end

      def to_s
        @contents
      end
    end
  end
end