#
# The HTML suites had links to the test files. Replace them with "include_examples".
#
module Converter
  module Suitefile
    class LinkReplacer
      def initialize(contents, suite_name)
        @suite_name = suite_name
        @lines = []
        contents.each_line do |line|
          m = match_it(line)
          if m
            @lines << create_line(m)
          else
            @lines << line.chomp
          end
        end
      end

      def match_it(line)
        line.match(/<a href="(.*?)\">/)
      end

      def create_line(m)
        examples_label = Utils::shared_examples_label(@suite_name, m[1])
        step_label = Utils::step_label(m[1])
        "  describe '%s' do \n    include_examples '%s' \n  end" % [ step_label, examples_label ]
      end

      def to_s
        @lines.join("\n")
      end
    end
  end
end
