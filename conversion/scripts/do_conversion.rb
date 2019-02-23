#! /usr/bin/env ruby

require 'fileutils'
require_relative 'converter/converter'
require_relative 'converter/compressor'
require_relative 'converter/white_space_remover'
require_relative 'converter/commenter'
require_relative 'converter/common_tag_replacer'
require_relative 'converter/it_grouper'
require_relative 'converter/wrapper_replacer'

input_dirname = "../tests_in_html"
output_dirname = "../tests_in_ruby"

input_dir = File.expand_path('../tests_in_html', File.dirname(__FILE__))
output_dir = File.expand_path('../tests_in_ruby', File.dirname(__FILE__))
  
FileUtils.remove_dir(output_dir) if File.exist?(output_dir)
Dir.mkdir(output_dir)

converter = Converter::Converter.new(input_dir, output_dir)
converter.convert("CreatePeople/AddFacultyInfo.html")

# TODO:
#
# Go though all folders in the input directory
# Create suite file
# Create test files (with correct names)
# Summarize? (how many suites, how many files, how many steps)
# Summarize the un-converted tags (how many, list first 20 with locations)
#
# Remove wait for tinymce
# Replace login and logout