#
# The HTML suites had links to the test files. Replace them with "include_examples".
#
module Converter
  module Suitefile
    class LinkReplacer
      def initialize(contents)
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
        line.match(/.*<a href="(.*?)">.*/)
      end

      def create_line(m)
        label = Utils::text_label(m[1])
        "  describe '%s' { include_examples '%s' }" % [ label, label ]
      end

      def to_s
        @lines.join("\n")
      end
    end
  end
end
