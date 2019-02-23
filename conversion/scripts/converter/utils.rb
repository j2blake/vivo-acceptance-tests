module Converter
  class Utils
    class <<self
      def create_directory_for(path)
        dir = File.dirname(path)
        FileUtils.mkdir_p(dir) unless File.directory?(dir)
      end
      
      def test_output_filename(path)
        base = File.basename(path)
        base.gsub!(/\.html$/, '.rb')
        base.gsub!(/([A-Z])/, '_\1')
        base.downcase.strip
      end

      def text_label(path)
        base = File.basename(path)
        base.gsub!(/([A-Z])/, ' \1')
        base.strip
      end

    end
  end
end