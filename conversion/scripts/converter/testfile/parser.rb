module Converter
  module Testfile
    class Parser
      def parse(contents_string)
        contents_string.split("\n").map { |l| Line.new(l) }
      end

      def unparse(lines)
        lines.map { |l| l.text }.join("\n")
      end

    end

    class Line
      attr_accessor :text
      attr_accessor :comment
      attr_accessor :field1
      attr_accessor :field2
      attr_accessor :field3
      #
      def initialize(text)
        @text = text
        @comment = nil
        @field1 = ""
        @field2 = ""
        @field3 = ""

        if m = text.match(%r{^[\s#]*<!--(.+)-->\s*$})
          @comment = m[1].strip
        elsif m = text.match(%r{^[\s#]*<tr><td>(.*)</td><td>(.*)</td><td>(.*)</td></tr>\s*$})
          @field1 = m[1].strip
          @field2 = m[2].strip
          @field3 = m[3].strip
        elsif m = text.match(%r{^[\s#]*<tr><td>(.*)</td><td>(.*)</td></tr>\s*$})
          @field1 = m[1].strip
          @field2 = m[2].strip
        end
      end

      def match(regex1, regex2 = /.*/, regex3 = /.*/)
        if !@comment &&
        (m0 = @field1.match(regex1)) &&
        (m1 = @field2.match(regex2)) &&
        (m2 = @field3.match(regex3))
          # puts "%s: match '%s', '%s', '%s' ==> '%s', '%s', '%s'" % [ self, regex1, regex2, regex3, m0, m1, m2 ]
          yield [ m0, m1, m2 ] if block_given?
        else
          nil
        end
      end

      def to_s
        "Converter::Testfile::Parser::Line[text='%s', comment='%s', field1='%s', field2='%s', field3='%s']" %
        [ @text, @comment, @field1, @field2, @field3 ]
      end
    end
  end
end