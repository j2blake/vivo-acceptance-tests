module Converter
  module Testfile
    class UselessTagRemover
      def initialize(contents)
        @lines = []
        contents.each_line do |l|
          @line = l.chomp
          @lines << @line unless is_delete_cookies_tag || is_wait_for_tinymce
        end
      end

      def is_delete_cookies_tag
        @line.match? %r{.*<td>deleteAllVisibleCookies</td>.*}
      end

      def is_wait_for_tinymce
        @line.match? %r{.*<td>waitForElementPresent</td><td>tinymce</td>.*}
      end

      def to_s
        @lines.join("\n")
      end
    end
  end
end