module Converter
  module Testfile
    class Converter
      def initialize(input_dir, output_dir)
        @input_dir = input_dir
        @output_dir = output_dir
      end

      def convert(suite_name, filename)
        $reporter.convert_test_file(suite_name, filename)

        input_path = File.expand_path(filename, File.expand_path(suite_name, @input_dir))
        output_path = File.expand_path(Utils::test_output_filename(filename), File.expand_path(suite_name, @output_dir))

        Utils::create_directory_for(output_path)

        scratchpad = Scratchpad.new(File.read(input_path), Utils::shared_examples_label(suite_name, input_path))
        IO.write(output_path, scratchpad.to_s)
      end
    end

    class Scratchpad
      def initialize(contents, label)
        @contents = contents
        @contents = Common::Compressor.new(@contents).to_s
        @contents = Common::WhiteSpaceRemover.new(@contents).to_s
        @contents = Common::Commenter.new(@contents).to_s
        @contents = WrapperReplacer.new(@contents.to_s, label).to_s
        @contents = UselessTagRemover.new(@contents).to_s

        @parsed = Parser.new.parse(@contents)
        @parsed = UserAccountReplacer.new(@parsed).go
        @contents = Parser.new.unparse(@parsed)

        @contents = PhraseReplacer.new(@contents, label).to_s
        @contents = UncertainTagDeferrer.new(@contents).to_s
        
        @parsed = Parser.new.parse(@contents)
        @parsed = CommonTagReplacer.new(@parsed).go
        @contents = Parser.new.unparse(@parsed)

        @contents = ItGrouper.new(@contents).to_s
        $reporter.tags_remaining(TagCounter.new(@contents).tags)
      end

      def to_s
        @contents
      end
    end
  end
end