module Converter
  class Settings
    attr_accessor :input_dir
    attr_accessor :output_dir
    def initialize
      @input_dirname = "../tests_in_html"
      @output_dirname = "../tests_in_ruby"

      # TODO: generalize these paths!
      @input_dir = File.expand_path(@input_dirname, File.dirname(File.dirname(__FILE__)))
      @output_dir = "/Users/jeb228/Development/VIVO/AcceptanceTests/projects/vivo-acceptance-tests/rubytests/spec/converted"
    end

  end

end