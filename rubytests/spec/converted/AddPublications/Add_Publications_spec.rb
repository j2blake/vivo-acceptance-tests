require_relative '../../configuration'
require_relative '_add_test_faculty.rb'
require_relative '_validate_fields.rb'
require_relative '_delete_validation_stuff.rb'
require_relative '_add_test_faculty_back.rb'
require_relative '_add_book.rb'
require_relative '_add_article.rb'
require_relative '_add_chapter.rb'
require_relative '_add_conference.rb'
require_relative '_check_public_view.rb'
require_relative '_check_index_view.rb'
require_relative '_search_publications.rb'
require_relative '_publication_display.rb'
require_relative '_delete_conference.rb'
require_relative '_delete_chapter.rb'
require_relative '_delete_article.rb'
require_relative '_delete_book.rb'
require_relative '_delete_index_stuff.rb'
require_relative '_delete_test_faculty.rb'

describe 'Add Publications' do
  describe 'Add Test Faculty' do 
    include_examples 'Add Publications: Add Test Faculty' 
  end
  describe 'Validate Fields' do 
    include_examples 'Add Publications: Validate Fields' 
  end
  describe 'Delete Validation Stuff' do 
    include_examples 'Add Publications: Delete Validation Stuff' 
  end
  describe 'Add Test Faculty Back' do 
    include_examples 'Add Publications: Add Test Faculty Back' 
  end
  describe 'Add Book' do 
    include_examples 'Add Publications: Add Book' 
  end
  describe 'Add Article' do 
    include_examples 'Add Publications: Add Article' 
  end
  describe 'Add Chapter' do 
    include_examples 'Add Publications: Add Chapter' 
  end
  describe 'Add Conference' do 
    include_examples 'Add Publications: Add Conference' 
  end
  describe 'Check Public View' do 
    include_examples 'Add Publications: Check Public View' 
  end
  describe 'Check Index View' do 
    include_examples 'Add Publications: Check Index View' 
  end
  describe 'Search Publications' do 
    include_examples 'Add Publications: Search Publications' 
  end
  describe 'Publication Display' do 
    include_examples 'Add Publications: Publication Display' 
  end
  describe 'Delete Conference' do 
    include_examples 'Add Publications: Delete Conference' 
  end
  describe 'Delete Chapter' do 
    include_examples 'Add Publications: Delete Chapter' 
  end
  describe 'Delete Article' do 
    include_examples 'Add Publications: Delete Article' 
  end
  describe 'Delete Book' do 
    include_examples 'Add Publications: Delete Book' 
  end
  describe 'Delete Index Stuff' do 
    include_examples 'Add Publications: Delete Index Stuff' 
  end
  describe 'Delete Test Faculty' do 
    include_examples 'Add Publications: Delete Test Faculty' 
  end
end