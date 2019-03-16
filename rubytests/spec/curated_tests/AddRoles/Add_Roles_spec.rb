require_relative '../../configuration'
require_relative '_create_test_faculty_member.rb'
require_relative '_create_test_librarian.rb'
require_relative '_add_faculty_member_roles1.rb'
require_relative '_add_faculty_member_roles2.rb'
require_relative '_add_librarian_roles1.rb'
require_relative '_add_librarian_roles2.rb'
require_relative '_add_faculty_member_roles3.rb'
require_relative '_verify_all_roles_searchable.rb'
require_relative '_check_public_view.rb'
require_relative '_check_index_view.rb'
require_relative '_grant_display.rb'
require_relative '_check_repair_mode.rb'
require_relative '_delete_test_faculty_member.rb'
require_relative '_delete_test_librarian.rb'
require_relative '_delete_index_stuff.rb'

describe 'Add Roles' do
  describe 'Create Test Faculty Member' do 
    include_examples 'Add Roles: Create Test Faculty Member' 
  end
  describe 'Create Test Librarian' do 
    include_examples 'Add Roles: Create Test Librarian' 
  end
  describe 'Add Faculty Member Roles1' do 
    include_examples 'Add Roles: Add Faculty Member Roles1' 
  end
  describe 'Add Faculty Member Roles2' do 
    include_examples 'Add Roles: Add Faculty Member Roles2' 
  end
  describe 'Add Librarian Roles1' do 
    include_examples 'Add Roles: Add Librarian Roles1' 
  end
  describe 'Add Librarian Roles2' do 
    include_examples 'Add Roles: Add Librarian Roles2' 
  end
  describe 'Add Faculty Member Roles3' do 
    include_examples 'Add Roles: Add Faculty Member Roles3' 
  end
  describe 'Verify All Roles Searchable' do 
    include_examples 'Add Roles: Verify All Roles Searchable' 
  end
  describe 'Check Public View' do 
    include_examples 'Add Roles: Check Public View' 
  end
  describe 'Check Index View' do 
    include_examples 'Add Roles: Check Index View' 
  end
  describe 'Grant Display' do 
    include_examples 'Add Roles: Grant Display' 
  end
  describe 'Check Repair Mode' do 
    include_examples 'Add Roles: Check Repair Mode' 
  end
  describe 'Delete Test Faculty Member' do 
    include_examples 'Add Roles: Delete Test Faculty Member' 
  end
  describe 'Delete Test Librarian' do 
    include_examples 'Add Roles: Delete Test Librarian' 
  end
  describe 'Delete Index Stuff' do 
    include_examples 'Add Roles: Delete Index Stuff' 
  end
end