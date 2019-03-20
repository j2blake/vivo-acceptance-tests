require_relative '../../configuration'
require_relative '_add_test_faculty.rb'
require_relative '_add_publications.rb'
require_relative '_add_publications2.rb'
require_relative '_delete_test_faculty.rb'
require_relative '_delete_index_stuff.rb'

describe 'Check Map Of Science' do
  describe 'Add Test Faculty' do 
    include_examples 'Check Map Of Science: Add Test Faculty' 
  end
  describe 'Add Publications' do 
    include_examples 'Check Map Of Science: Add Publications' 
  end
  describe 'Add Publications2' do 
    include_examples 'Check Map Of Science: Add Publications2' 
  end
  describe 'Delete Test Faculty' do 
    include_examples 'Check Map Of Science: Delete Test Faculty' 
  end
  describe 'Delete Index Stuff' do 
    include_examples 'Check Map Of Science: Delete Index Stuff' 
  end
end