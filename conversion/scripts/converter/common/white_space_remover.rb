#
# Remove any spaces between the tags of <tr> and <td>, so they are in canonical form.
#
module Converter
  module Common
    class WhiteSpaceRemover
      def initialize(contents)
        @contents = contents

        @contents.gsub!(%r{<td>\s+</td>}, "<td></td>")
        @contents.gsub!(%r{</td>\s+<td>}, "</td><td>")
        @contents.gsub!(%r{<tr>\s+<td>}, "<tr><td>")
        @contents.gsub!(%r{</td>\s+</tr>}, "</td></tr>")
      end

      def to_s
        @contents
      end
    end
  end
end
