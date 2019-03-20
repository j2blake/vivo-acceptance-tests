require_relative '../../configuration'
require_relative '_add_test_faculty.rb'
require_relative '_check_gadgets.rb'
require_relative '_delete_test_faculty.rb'

describe 'Open Social Gadgets' do
  describe 'Add Test Faculty' do 
    include_examples 'Open Social Gadgets: Add Test Faculty' 
  end
  describe 'Check Gadgets' do 
    include_examples 'Open Social Gadgets: Check Gadgets' 
  end
  describe 'Delete Test Faculty' do 
    include_examples 'Open Social Gadgets: Delete Test Faculty' 
  end
end