module Converter
  class FileCopier
    def initialize(input_dir, output_dir)
      @input_dir = input_dir
      @output_dir = output_dir
    end

    def copy(suite_name, filename)
      $reporter.copy_file(suite_name, filename)
      input_path = File.expand_path(filename, File.expand_path(suite_name, @input_dir))
      output_path = File.expand_path(filename, File.expand_path(suite_name, @output_dir))

      Utils::create_directory_for(output_path)
      FileUtils.cp(input_path, output_path)
    end
  end
end