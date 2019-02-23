module Converter
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