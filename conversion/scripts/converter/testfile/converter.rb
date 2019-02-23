module Converter
  module Testfile
    class Converter
      def initialize(input_dir, output_dir)
        @input_dir = input_dir
        @output_dir = output_dir
      end

      def convert(relative_input_path)
        relative_output_path = relative_input_path.sub(/html$/, "rb")
        input_path = File.expand_path(relative_input_path, @input_dir)
        output_path = File.expand_path(relative_output_path, @output_dir)

        create_directory_for(output_path)

        scratchpad = Scratchpad.new(File.read(input_path), create_label(input_path))
        IO.write(output_path, scratchpad.to_s)

        puts "Converted #{input_path}"
      end

      def create_directory_for(path)
        dir = File.dirname(path)
        FileUtils.mkdir_p(dir) unless File.directory?(dir)
      end

      def create_label(path)
        base = File.basename(path)
        base.gsub!(/\.html$/, '')
        base.gsub!(/([A-Z])/, ' \1')
        base.strip
      end
    end

    class Scratchpad
      def initialize(contents, label)
        @contents = contents
        @contents = Compressor.new(@contents).to_s
        @contents = WhiteSpaceRemover.new(@contents).to_s
        @contents = Commenter.new(@contents).to_s
        @contents = WrapperReplacer.new(@contents.to_s, label).to_s
        @contents = CommonTagReplacer.new(@contents).to_s
        @contents = ItGrouper.new(@contents).to_s
      end

      def to_s
        @contents
      end
    end
  end
end