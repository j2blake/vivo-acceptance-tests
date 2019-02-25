#
# We don't need the line in the table that shows the table title.
# We don't ever need to rebuild the search index. 
#
module Converter
  module Suitefile
    class RemoveUnneededLines
      def initialize(contents)
        @lines = []
        contents.each_line do |line|
          unless is_rebuild_search_index(line) || is_table_header(line)
            @lines << line.chomp
          end
        end
      end

      def is_rebuild_search_index(line)
        line.match? %r{<a href="RebuildSearchIndex.html">}
      end

      def is_table_header(line)
        line.match? %r{<b>Test Suite</b>}
      end

      def to_s
        @lines.join("\n")
      end
    end
  end
end