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

      def step_label(suite_name)
        clean_label(suite_name)
      end

      def shared_examples_label(suite_name, path)
        clean_label(suite_name) + ": " + clean_label(path)
      end

      def clean_label(raw)
        base = File.basename(raw)
        base.gsub!(/\.html$/, '')
        base.gsub!(/([A-Z])/, ' \1')
        base.strip
      end

    end
  end
end