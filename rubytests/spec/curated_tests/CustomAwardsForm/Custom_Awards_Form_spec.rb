require_relative '../../configuration'
require_relative '_create_test_faculty_member.rb'
require_relative '_add_awards.rb'
require_relative '_change_awards.rb'
require_relative '_search_awards.rb'
require_relative '_check_public_view.rb'
require_relative '_check_index_view.rb'
require_relative '_delete_awards.rb'
require_relative '_delete_test_faculty_member.rb'

describe 'Custom Awards Form' do
  describe 'Create Test Faculty Member' do 
    include_examples 'Custom Awards Form: Create Test Faculty Member' 
  end
  describe 'Add Awards' do 
    include_examples 'Custom Awards Form: Add Awards' 
  end
  describe 'Change Awards' do 
    include_examples 'Custom Awards Form: Change Awards' 
  end
  describe 'Search Awards' do 
    include_examples 'Custom Awards Form: Search Awards' 
  end
  describe 'Check Public View' do 
    include_examples 'Custom Awards Form: Check Public View' 
  end
  describe 'Check Index View' do 
    include_examples 'Custom Awards Form: Check Index View' 
  end
  describe 'Delete Awards' do 
    include_examples 'Custom Awards Form: Delete Awards' 
  end
  describe 'Delete Test Faculty Member' do 
    include_examples 'Custom Awards Form: Delete Test Faculty Member' 
  end
end