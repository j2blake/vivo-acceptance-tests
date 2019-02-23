# 
# Turn every line of the file into a Ruby comment, so the file will run.
#
module Converter
  module Common
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