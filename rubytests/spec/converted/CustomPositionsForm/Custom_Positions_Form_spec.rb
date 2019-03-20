require_relative '../../configuration'
require_relative '_create_test_faculty_member.rb'
require_relative '_add_positions.rb'
require_relative '_change_positions.rb'
require_relative '_search_positions.rb'
require_relative '_check_public_view.rb'
require_relative '_check_index_view.rb'
require_relative '_delete_positions.rb'
require_relative '_delete_test_faculty_member.rb'

describe 'Custom Positions Form' do
  describe 'Create Test Faculty Member' do 
    include_examples 'Custom Positions Form: Create Test Faculty Member' 
  end
  describe 'Add Positions' do 
    include_examples 'Custom Positions Form: Add Positions' 
  end
  describe 'Change Positions' do 
    include_examples 'Custom Positions Form: Change Positions' 
  end
  describe 'Search Positions' do 
    include_examples 'Custom Positions Form: Search Positions' 
  end
  describe 'Check Public View' do 
    include_examples 'Custom Positions Form: Check Public View' 
  end
  describe 'Check Index View' do 
    include_examples 'Custom Positions Form: Check Index View' 
  end
  describe 'Delete Positions' do 
    include_examples 'Custom Positions Form: Delete Positions' 
  end
  describe 'Delete Test Faculty Member' do 
    include_examples 'Custom Positions Form: Delete Test Faculty Member' 
  end
end