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

      def match(target1, target2 = /.*/, target3 = /.*/)
        if !@comment &&
        (m0 = match_field(@field1, target1)) &&
        (m1 = match_field(@field2, target2)) &&
        (m2 = match_field(@field3, target3))
          # puts "%s: match '%s', '%s', '%s' ==> '%s', '%s', '%s'" % [ self, regex1, regex2, regex3, m0, m1, m2 ]
          if block_given?
            yield [ m0, m1, m2 ]
          else
            true
          end
        else
          nil
        end
      end

      def match_field(field, target)
        case target
        when Regexp
          field.match(target)
        when String
          (field == target) ? [field] : nil
        when NilClass
          field
        end
      end

      def match?(target1, target2 = /.*/, target3 = /.*/)
        ! match(target1, target2, target3).nil?
      end

      def to_s
        "Converter::Testfile::Parser::Line[text='%s', comment='%s', field1='%s', field2='%s', field3='%s']" %
        [ @text, @comment, @field1, @field2, @field3 ]
      end
    end
  end
end