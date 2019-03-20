require_relative '../../configuration'
require_relative '_create_test_faculty_member.rb'
require_relative '_add_advises.rb'
require_relative '_change_advises.rb'
require_relative '_search_advises.rb'
require_relative '_check_public_view.rb'
require_relative '_check_index_view.rb'
require_relative '_delete_advises.rb'
require_relative '_delete_test_faculty_member.rb'

describe 'Custom Advises Form' do
  describe 'Create Test Faculty Member' do 
    include_examples 'Custom Advises Form: Create Test Faculty Member' 
  end
  describe 'Add Advises' do 
    include_examples 'Custom Advises Form: Add Advises' 
  end
  describe 'Change Advises' do 
    include_examples 'Custom Advises Form: Change Advises' 
  end
  describe 'Search Advises' do 
    include_examples 'Custom Advises Form: Search Advises' 
  end
  describe 'Check Public View' do 
    include_examples 'Custom Advises Form: Check Public View' 
  end
  describe 'Check Index View' do 
    include_examples 'Custom Advises Form: Check Index View' 
  end
  describe 'Delete Advises' do 
    include_examples 'Custom Advises Form: Delete Advises' 
  end
  describe 'Delete Test Faculty Member' do 
    include_examples 'Custom Advises Form: Delete Test Faculty Member' 
  end
end