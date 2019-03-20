require_relative '../../configuration'
require_relative '_create_faculty_member.rb'
require_relative '_create_librarian.rb'
require_relative '_add_faculty_info.rb'
require_relative '_edit_faculty_info.rb'
require_relative '_add_faculty_info2.rb'
require_relative '_public_faculty_info.rb'
require_relative '_search_faculty_info.rb'
require_relative '_delete_faculty_info.rb'
require_relative '_upload_faculty_image.rb'
require_relative '_change_faculty_image.rb'
require_relative '_verify_image_display.rb'
require_relative '_upload_librarian_image.rb'
require_relative '_change_librarian_image.rb'
require_relative '_associate_lib_to_fac.rb'
require_relative '_search_people.rb'
require_relative '_browse_index.rb'
require_relative '_test_unicode_name.rb'
require_relative '_delete_faculty_image.rb'
require_relative '_delete_librarian_image.rb'
require_relative '_delete_lib_to_fac_association.rb'
require_relative '_delete_test_people.rb'
require_relative '_upload_non_person_image.rb'
require_relative '_reorder_people.rb'

describe 'Create People' do
  describe 'Create Faculty Member' do 
    include_examples 'Create People: Create Faculty Member' 
  end
  describe 'Create Librarian' do 
    include_examples 'Create People: Create Librarian' 
  end
  describe 'Add Faculty Info' do 
    include_examples 'Create People: Add Faculty Info' 
  end
  describe 'Edit Faculty Info' do 
    include_examples 'Create People: Edit Faculty Info' 
  end
  describe 'Add Faculty Info2' do 
    include_examples 'Create People: Add Faculty Info2' 
  end
  describe 'Public Faculty Info' do 
    include_examples 'Create People: Public Faculty Info' 
  end
  describe 'Search Faculty Info' do 
    include_examples 'Create People: Search Faculty Info' 
  end
  describe 'Delete Faculty Info' do 
    include_examples 'Create People: Delete Faculty Info' 
  end
  describe 'Upload Faculty Image' do 
    include_examples 'Create People: Upload Faculty Image' 
  end
  describe 'Change Faculty Image' do 
    include_examples 'Create People: Change Faculty Image' 
  end
  describe 'Verify Image Display' do 
    include_examples 'Create People: Verify Image Display' 
  end
  describe 'Upload Librarian Image' do 
    include_examples 'Create People: Upload Librarian Image' 
  end
  describe 'Change Librarian Image' do 
    include_examples 'Create People: Change Librarian Image' 
  end
  describe 'Associate Lib To Fac' do 
    include_examples 'Create People: Associate Lib To Fac' 
  end
  describe 'Search People' do 
    include_examples 'Create People: Search People' 
  end
  describe 'Browse Index' do 
    include_examples 'Create People: Browse Index' 
  end
  describe 'Test Unicode Name' do 
    include_examples 'Create People: Test Unicode Name' 
  end
  describe 'Delete Faculty Image' do 
    include_examples 'Create People: Delete Faculty Image' 
  end
  describe 'Delete Librarian Image' do 
    include_examples 'Create People: Delete Librarian Image' 
  end
  describe 'Delete Lib To Fac Association' do 
    include_examples 'Create People: Delete Lib To Fac Association' 
  end
  describe 'Delete Test People' do 
    include_examples 'Create People: Delete Test People' 
  end
  describe 'Upload Non Person Image' do 
    include_examples 'Create People: Upload Non Person Image' 
  end
  describe 'Reorder People' do 
    include_examples 'Create People: Reorder People' 
  end
end