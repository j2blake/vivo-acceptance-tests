require_relative '../../configuration'
require_relative '_add_class_group_times.rb'
require_relative '_add_sub_class_hours.rb'
require_relative '_add_sub_class_minutes.rb'
require_relative '_add_individual_in_hours.rb'
require_relative '_delete_sub_class_minutes.rb'
require_relative '_view_class_hierarchy.rb'
require_relative '_delete_individual_in_hours.rb'
require_relative '_delete_sub_class_hours.rb'
require_relative '_delete_class_group_times.rb'

describe 'Create Classes' do
  describe 'Add Class Group Times' do 
    include_examples 'Create Classes: Add Class Group Times' 
  end
  describe 'Add Sub Class Hours' do 
    include_examples 'Create Classes: Add Sub Class Hours' 
  end
  describe 'Add Sub Class Minutes' do 
    include_examples 'Create Classes: Add Sub Class Minutes' 
  end
  describe 'Add Individual In Hours' do 
    include_examples 'Create Classes: Add Individual In Hours' 
  end
  describe 'Delete Sub Class Minutes' do 
    include_examples 'Create Classes: Delete Sub Class Minutes' 
  end
  describe 'View Class Hierarchy' do 
    include_examples 'Create Classes: View Class Hierarchy' 
  end
  describe 'Delete Individual In Hours' do 
    include_examples 'Create Classes: Delete Individual In Hours' 
  end
  describe 'Delete Sub Class Hours' do 
    include_examples 'Create Classes: Delete Sub Class Hours' 
  end
  describe 'Delete Class Group Times' do 
    include_examples 'Create Classes: Delete Class Group Times' 
  end
end