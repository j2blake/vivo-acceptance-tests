module Converter
  module Suitefile
    class Converter
      def initialize(input_dir, output_dir)
        @input_dir = input_dir
        @output_dir = output_dir
      end

      def convert(suite_name)
        $reporter.convert_suite_file(suite_name)

        input_path = File.expand_path("suite.html", File.expand_path(suite_name, @input_dir))
        output_path = File.expand_path(output_filename(suite_name), File.expand_path(suite_name, @output_dir))

        Utils::create_directory_for(output_path)

        scratchpad = Scratchpad.new(File.read(input_path), suite_name)
        IO.write(output_path, scratchpad.to_s)
      end

      def output_filename(suite_name)
        base = suite_name + '.rb'
        base.gsub!(/([A-Z])/, '_\1')
        base.strip.slice(1..-1)
      end
    end

    class Scratchpad
      def initialize(contents, suite_name)
        @contents = contents
        @suite_name = suite_name
      end

      def to_s
        @suite_name
      end
    end
  end
end