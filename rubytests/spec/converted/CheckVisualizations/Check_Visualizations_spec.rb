require_relative '../../configuration'
require_relative '_add_test_faculty.rb'
require_relative '_add_publications.rb'
require_relative '_add_co_authors.rb'
require_relative '_add_grants.rb'
require_relative '_add_co_investigators.rb'
require_relative '_test_temporal_graphs.rb'
require_relative '_check_grant_dates.rb'
require_relative '_delete_test_faculty.rb'
require_relative '_delete_test_cos.rb'
require_relative '_delete_index_stuff.rb'

describe 'Check Visualizations' do
  describe 'Add Test Faculty' do 
    include_examples 'Check Visualizations: Add Test Faculty' 
  end
  describe 'Add Publications' do 
    include_examples 'Check Visualizations: Add Publications' 
  end
  describe 'Add Co Authors' do 
    include_examples 'Check Visualizations: Add Co Authors' 
  end
  describe 'Add Grants' do 
    include_examples 'Check Visualizations: Add Grants' 
  end
  describe 'Add Co Investigators' do 
    include_examples 'Check Visualizations: Add Co Investigators' 
  end
  describe 'Test Temporal Graphs' do 
    include_examples 'Check Visualizations: Test Temporal Graphs' 
  end
  describe 'Check Grant Dates' do 
    include_examples 'Check Visualizations: Check Grant Dates' 
  end
  describe 'Delete Test Faculty' do 
    include_examples 'Check Visualizations: Delete Test Faculty' 
  end
  describe 'Delete Test Cos' do 
    include_examples 'Check Visualizations: Delete Test Cos' 
  end
  describe 'Delete Index Stuff' do 
    include_examples 'Check Visualizations: Delete Index Stuff' 
  end
end