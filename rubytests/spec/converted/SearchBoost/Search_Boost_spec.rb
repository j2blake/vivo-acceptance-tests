require_relative '../../configuration'
require_relative '_create_test_people.rb'
require_relative '_test_individual_boost.rb'
require_relative '_delete_test_people.rb'

describe 'Search Boost' do
  describe 'Create Test People' do 
    include_examples 'Search Boost: Create Test People' 
  end
  describe 'Test Individual Boost' do 
    include_examples 'Search Boost: Test Individual Boost' 
  end
  describe 'Delete Test People' do 
    include_examples 'Search Boost: Delete Test People' 
  end
end