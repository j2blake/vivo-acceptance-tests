#! /usr/bin/env ruby

require 'fileutils'

require_relative 'converter/reporter'
require_relative 'converter/file_copier'
require_relative 'converter/utils'
require_relative 'converter/testfile/abstract_parsed_lines_replacer'
require_relative 'converter/testfile/parser'
require_relative 'converter/testfile/converter'
require_relative 'converter/testfile/useless_tag_remover'
require_relative 'converter/testfile/uncertain_tag_deferrer'
require_relative 'converter/testfile/common_tag_replacer'
require_relative 'converter/testfile/it_grouper'
require_relative 'converter/testfile/phrase_replacer'
require_relative 'converter/testfile/user_account_replacer'
require_relative 'converter/testfile/wrapper_replacer'
require_relative 'converter/testfile/tag_counter'
require_relative 'converter/suitefile/converter'
require_relative 'converter/suitefile/wrapper_replacer'
require_relative 'converter/suitefile/link_replacer'
require_relative 'converter/suitefile/remove_unneeded_lines'
require_relative 'converter/common/commenter'
require_relative 'converter/common/compressor'
require_relative 'converter/common/white_space_remover'

input_dirname = "../tests_in_html"
output_dirname = "../tests_in_ruby"

def is_suite_file(f)
  f.downcase == "suite.html"
end

def is_index_rebuilder(f)
  f == "RebuildSearchIndex.html"
end

def process_suite(suite_dir, suite_name, test_converter, suite_converter, file_copier)
  children = Dir.children(suite_dir)
  $reporter.missing_suite_file(suite_name) unless children.any? {|f| is_suite_file(f) }

  children.each do |filename|
    if is_suite_file(filename)
      suite_converter.convert(suite_name)
    elsif is_index_rebuilder(filename)
      # skip it
    elsif (File.extname(filename) == ".html")
      test_converter.convert(suite_name, filename)
    else
      file_copier.copy(suite_name, filename)
    end
  end
end

# TODO: generalize these paths!
input_dir = File.expand_path(input_dirname, File.dirname(__FILE__))
output_dir = "/Users/jeb228/Development/VIVO/AcceptanceTests/projects/vivo-acceptance-tests/rubytests/spec/converted"

$reporter = Converter::Reporter.new
$reporter.command_line([ input_dir, output_dir ])

FileUtils.remove_dir(output_dir) if File.exist?(output_dir)
Dir.mkdir(output_dir)

test_converter = Converter::Testfile::Converter.new(input_dir, output_dir)
suite_converter = Converter::Suitefile::Converter.new(input_dir, output_dir)
file_copier = Converter::FileCopier.new(input_dir, output_dir)

Dir.each_child(input_dir) do |suite_name|
  suite_dir = File.expand_path(suite_name, input_dir)
  if File.directory?(suite_dir)
    process_suite(suite_dir, suite_name, test_converter, suite_converter, file_copier)
  end
end

$reporter.report

# TODO:
#
# Remove wait for tinymce
# Replace login and logout