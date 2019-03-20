require_relative '../../configuration'
require_relative '_create_test_departments.rb'
require_relative '_create_test_people.rb'
require_relative '_check_results.rb'
require_relative '_delete_test_people.rb'
require_relative '_delete_test_departments.rb'

describe 'Short Views' do
  describe 'Create Test Departments' do 
    include_examples 'Short Views: Create Test Departments' 
  end
  describe 'Create Test People' do 
    include_examples 'Short Views: Create Test People' 
  end
  describe 'Check Results' do 
    include_examples 'Short Views: Check Results' 
  end
  describe 'Delete Test People' do 
    include_examples 'Short Views: Delete Test People' 
  end
  describe 'Delete Test Departments' do 
    include_examples 'Short Views: Delete Test Departments' 
  end
end