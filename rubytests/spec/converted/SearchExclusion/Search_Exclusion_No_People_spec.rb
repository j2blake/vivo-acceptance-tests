require_relative '../../configuration'
require_relative '_create_test_faculty_member.rb'
require_relative '_search_not_found.rb'
require_relative '_delete_test_faculty_member.rb'

describe 'Search Exclusion' do
  describe 'Create Test Faculty Member' do 
    include_examples 'Search Exclusion: Create Test Faculty Member' 
  end
  describe 'Search Not Found' do 
    include_examples 'Search Exclusion: Search Not Found' 
  end
  describe 'Delete Test Faculty Member' do 
    include_examples 'Search Exclusion: Delete Test Faculty Member' 
  end
end