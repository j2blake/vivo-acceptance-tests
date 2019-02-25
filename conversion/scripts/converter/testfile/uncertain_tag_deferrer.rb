module Converter
  module Testfile
    class UncertainTagDeferrer
      def initialize(contents)
        @lines = []
        contents.each_line do |l|
          @line = l.chomp
          @m = @line.match %r{<td>(.*?)</td><td>(.*?)</td><td>(.*?)</td>}
          
          if @m && %w[pause waitForPageToLoad refreshAndWait].include?(@m[1])
            @lines << "# " + @line
          else
            @lines << @line
          end
        end
      end

      def to_s
        @lines.join("\n")
      end
    end
  end
end