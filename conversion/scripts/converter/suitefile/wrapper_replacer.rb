#
# Discard the lines at the top and bottom of the file,
# and replace them with better lines.
#
module Converter
  module Suitefile
    class WrapperReplacer
      def initialize(contents, suite_name)
        @suite_name = suite_name
        @lines = []
        @discarding = true
        @testfiles = collect_test_filenames(contents)

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

      def collect_test_filenames(contents)
        contents.each_line.reduce([]) do |names, line|
          line.match(/<a href="(.*)">/) do |m|
            names << m[1]
          end
          names
        end
      end

      def last_discard_at_top
        @line.include? "<tbody>"
      end

      def first_discard_at_bottom
        @line.include? "</tbody>"
      end

      def write_top_wrapper_lines
        @lines << "require_relative '../../configuration'"
        @testfiles.each do |fn|
          @lines << "require_relative '%s'" % [ Utils::test_output_filename(fn) ]
        end
        @lines << ""
        @lines << "describe '%s' do" % [ Utils::step_label(@suite_name) ]
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
