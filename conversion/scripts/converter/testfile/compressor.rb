module Converter
  module Testfile
    class Compressor
      def initialize(contents)
        @lines = []
        @buffering = false

        contents.each_line do |line|
          @line = line.chomp
          if @buffering
            add_to_buffer
            if ending_buffer
              dump_buffer_to_lines
            end
          else
            if starting_buffer
              start_buffer
            else
              write_line_to_lines
            end
          end
        end
      end

      def starting_buffer
        (@line.match? %r{.*<tr>.*}) && ! (@line.match? %r{.*</tr>.*})
      end

      def ending_buffer
        @line.match? %r{.*</tr>.*}
      end

      def start_buffer
        @buffer = @line
        @buffering = true
      end

      def add_to_buffer
        @buffer += " " + @line
      end

      def dump_buffer_to_lines
        @lines << @buffer
        @buffering = false
      end

      def write_line_to_lines
        @lines << @line
      end

      def to_s
        @lines.join("\n")
      end
    end
  end
end