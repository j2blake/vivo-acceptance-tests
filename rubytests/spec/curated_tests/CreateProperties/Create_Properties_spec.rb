require_relative '../../configuration'
require_relative '_add_property_group_place.rb'
require_relative '_change_place_display_rank.rb'
require_relative '_add_obj_prop_year_founded.rb'
require_relative '_edit_obj_prop_year_founded.rb'
require_relative '_add_museum.rb'
require_relative '_add_museum_year_founded.rb'
require_relative '_add_data_prop_arch_details.rb'
require_relative '_add_museum_arch_details.rb'
require_relative '_delete_museum.rb'
require_relative '_delete_data_prop_arch_details.rb'
require_relative '_delete_obj_prop_year_founded.rb'
require_relative '_delete_property_group_place.rb'

describe 'Create Properties' do
  describe 'Add Property Group Place' do 
    include_examples 'Create Properties: Add Property Group Place' 
  end
  describe 'Change Place Display Rank' do 
    include_examples 'Create Properties: Change Place Display Rank' 
  end
  describe 'Add Obj Prop Year Founded' do 
    include_examples 'Create Properties: Add Obj Prop Year Founded' 
  end
  describe 'Edit Obj Prop Year Founded' do 
    include_examples 'Create Properties: Edit Obj Prop Year Founded' 
  end
  describe 'Add Museum' do 
    include_examples 'Create Properties: Add Museum' 
  end
  describe 'Add Museum Year Founded' do 
    include_examples 'Create Properties: Add Museum Year Founded' 
  end
  describe 'Add Data Prop Arch Details' do 
    include_examples 'Create Properties: Add Data Prop Arch Details' 
  end
  describe 'Add Museum Arch Details' do 
    include_examples 'Create Properties: Add Museum Arch Details' 
  end
  describe 'Delete Museum' do 
    include_examples 'Create Properties: Delete Museum' 
  end
  describe 'Delete Data Prop Arch Details' do 
    include_examples 'Create Properties: Delete Data Prop Arch Details' 
  end
  describe 'Delete Obj Prop Year Founded' do 
    include_examples 'Create Properties: Delete Obj Prop Year Founded' 
  end
  describe 'Delete Property Group Place' do 
    include_examples 'Create Properties: Delete Property Group Place' 
  end
end