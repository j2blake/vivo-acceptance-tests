require_relative '../../configuration'
require_relative '_edit_site_info.rb'
require_relative '_reorder_menus.rb'
require_relative '_validate_new_menus.rb'
require_relative '_create_h_t_m_l_page.rb'
require_relative '_remove_menu_changes.rb'

describe 'Initial Setup' do
  describe 'Edit Site Info' do 
    include_examples 'Initial Setup: Edit Site Info' 
  end
  describe 'Reorder Menus' do 
    include_examples 'Initial Setup: Reorder Menus' 
  end
  describe 'Validate New Menus' do 
    include_examples 'Initial Setup: Validate New Menus' 
  end
  describe 'Create H T M L Page' do 
    include_examples 'Initial Setup: Create H T M L Page' 
  end
  describe 'Remove Menu Changes' do 
    include_examples 'Initial Setup: Remove Menu Changes' 
  end
end