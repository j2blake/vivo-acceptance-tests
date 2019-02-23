module Converter
  module Testfile
    class WrapperReplacer
      def initialize(contents, label)
        @label = label
        @lines = []
        @discarding = true

        contents.each_line do |line|
          @line = line.chomp
          if @discarding
            if last_discard_at_top
              write_top_wrapper_lines
            end
          else
            if first_discard_at_bottom
              write_bottom_wrapper_lines
            else
              write_line_to_lines
            end
          end
        end
      end

      def last_discard_at_top
        @line.include? "<tbody>"
      end

      def first_discard_at_bottom
        @line.include? "</tbody>"
      end

      def write_top_wrapper_lines
        @lines << "shared_examples \"%s\" do" % [ @label ]
        @discarding = false
      end

      def write_bottom_wrapper_lines
        @lines << "end"
        @discarding = true
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
