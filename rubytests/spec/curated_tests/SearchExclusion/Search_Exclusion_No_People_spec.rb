require_relative '../../configuration'
require_relative '_create_test_faculty_member.rb'
require_relative '_search_not_found.rb'
require_relative '_delete_unindexed_test_faculty_member.rb'

describe 'Search Exclusion' do
  def before_starting_server
    source = File.expand_path("TestSearchExclusion.n3", File.dirname(__FILE__))
      dest = File.expand_path("home/rdf/display/everytime", $settings.output_path)
      FileUtils.cp(source, dest)
  end
  
  describe 'Create Test Faculty Member' do 
    include_examples 'Search Exclusion: Create Test Faculty Member' 
  end
  describe 'Search Not Found' do 
    include_examples 'Search Exclusion: Search Not Found' 
  end
  describe 'Delete UnIndexed Test Faculty Member' do 
    include_examples 'Search Exclusion: Delete UnIndexed Test Faculty Member' 
  end
end