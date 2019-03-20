require_relative '../../configuration'
require_relative '_create_organization.rb'
require_relative '_create_course.rb'
require_relative '_create_activity.rb'
require_relative '_create_event.rb'
require_relative '_create_topic.rb'
require_relative '_create_equipment.rb'
require_relative '_create_location.rb'
require_relative '_verify_all_things_searchable.rb'
require_relative '_check_public_view.rb'
require_relative '_check_index_view.rb'
require_relative '_check_browse_options.rb'
require_relative '_test_menu_management.rb'
require_relative '_delete_index_stuff.rb'

describe 'Add Non Person Things' do
  describe 'Create Organization' do 
    include_examples 'Add Non Person Things: Create Organization' 
  end
  describe 'Create Course' do 
    include_examples 'Add Non Person Things: Create Course' 
  end
  describe 'Create Activity' do 
    include_examples 'Add Non Person Things: Create Activity' 
  end
  describe 'Create Event' do 
    include_examples 'Add Non Person Things: Create Event' 
  end
  describe 'Create Topic' do 
    include_examples 'Add Non Person Things: Create Topic' 
  end
  describe 'Create Equipment' do 
    include_examples 'Add Non Person Things: Create Equipment' 
  end
  describe 'Create Location' do 
    include_examples 'Add Non Person Things: Create Location' 
  end
  describe 'Verify All Things Searchable' do 
    include_examples 'Add Non Person Things: Verify All Things Searchable' 
  end
  describe 'Check Public View' do 
    include_examples 'Add Non Person Things: Check Public View' 
  end
  describe 'Check Index View' do 
    include_examples 'Add Non Person Things: Check Index View' 
  end
  describe 'Check Browse Options' do 
    include_examples 'Add Non Person Things: Check Browse Options' 
  end
  describe 'Test Menu Management' do 
    include_examples 'Add Non Person Things: Test Menu Management' 
  end
  describe 'Delete Index Stuff' do 
    include_examples 'Add Non Person Things: Delete Index Stuff' 
  end
end