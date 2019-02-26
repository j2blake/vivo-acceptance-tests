module Converter
  module Testfile
    class ItGrouper
      def initialize(contents)
        @lines = []
        @buffering = false

        contents.each_line do |line|
          @line = line.chomp
          if @buffering
            if starting_buffer
              dump_buffer_to_lines
              start_buffer
            else
              add_to_buffer
            end
          else
            if starting_buffer
              start_buffer
            else
              write_line_to_lines
            end
          end
        end
        if @buffering
          dump_buffer_to_lines
        end
      end

      def starting_buffer
        @line.match? %r{^#\s*<!--(.*)-->\s*$}
      end

      def ending_buffer
        @line.match? %r{</tr>}
      end

      def start_buffer
        step_name = escape_quotes(@line.match(%r{<!--(.*)-->})[1])
        @buffer = []
        @buffer << "  it \"%s\" do" %  [ step_name ]
        @buffering = true
      end

      def add_to_buffer
        @buffer << "    " + @line
      end

      def dump_buffer_to_lines
        @buffer << "  end"
        @buffer << ""
        @lines.concat(@buffer)
        @buffering = false
      end

      def write_line_to_lines
        @lines << @line
      end
      
      def escape_quotes(raw)
        raw.gsub(%r{"}, "_")
      end

      def to_s
        @lines.join("\n")
      end
    end
  end
end