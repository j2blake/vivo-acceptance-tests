module Converter
  module Testfile
    class TagCounter
      def initialize(contents)
        @how_many = contents.split("\n").keep_if { |line| line.match? /\s*#<tr>.*/ }.size
      end

      def how_many
        @how_many
      end
    end
  end
end
