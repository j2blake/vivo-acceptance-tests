require_relative '../../configuration'
require_relative '_create_test_faculty_member.rb'
require_relative '_add_education_background.rb'
require_relative '_change_education_background.rb'
require_relative '_search_education_background.rb'
require_relative '_check_public_view.rb'
require_relative '_check_index_view.rb'
require_relative '_delete_educational_background.rb'
require_relative '_delete_test_faculty_member.rb'

describe 'Custom Education Form' do
  describe 'Create Test Faculty Member' do 
    include_examples 'Custom Education Form: Create Test Faculty Member' 
  end
  describe 'Add Education Background' do 
    include_examples 'Custom Education Form: Add Education Background' 
  end
  describe 'Change Education Background' do 
    include_examples 'Custom Education Form: Change Education Background' 
  end
  describe 'Search Education Background' do 
    include_examples 'Custom Education Form: Search Education Background' 
  end
  describe 'Check Public View' do 
    include_examples 'Custom Education Form: Check Public View' 
  end
  describe 'Check Index View' do 
    include_examples 'Custom Education Form: Check Index View' 
  end
  describe 'Delete Educational Background' do 
    include_examples 'Custom Education Form: Delete Educational Background' 
  end
  describe 'Delete Test Faculty Member' do 
    include_examples 'Custom Education Form: Delete Test Faculty Member' 
  end
end