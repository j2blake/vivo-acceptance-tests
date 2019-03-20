require_relative '../../configuration'
require_relative '_create_faculty_member.rb'
require_relative '_add_self_editor_id.rb'
require_relative '_create_new_self_editor_user.rb'
require_relative '_first_time_self_editor_login.rb'
require_relative '_try_new_self_editor_password.rb'
require_relative '_check_self_editor_privileges.rb'
require_relative '_restrict_logins.rb'
require_relative '_delete_new_self_editor_user.rb'
require_relative '_delete_faculty_info.rb'
require_relative '_create_new_self_editor_user2.rb'
require_relative '_first_time_self_editor_login2.rb'
require_relative '_try_new_self_editor_password2.rb'
require_relative '_create_faculty_member.rb'
require_relative '_add_self_editor_id2.rb'
require_relative '_check_self_editor_privileges.rb'
require_relative '_delete_new_self_editor_user.rb'
require_relative '_delete_faculty_info.rb'

describe 'Self Editing' do
  describe 'Create Faculty Member' do 
    include_examples 'Self Editing: Create Faculty Member' 
  end
  describe 'Add Self Editor Id' do 
    include_examples 'Self Editing: Add Self Editor Id' 
  end
  describe 'Create New Self Editor User' do 
    include_examples 'Self Editing: Create New Self Editor User' 
  end
  describe 'First Time Self Editor Login' do 
    include_examples 'Self Editing: First Time Self Editor Login' 
  end
  describe 'Try New Self Editor Password' do 
    include_examples 'Self Editing: Try New Self Editor Password' 
  end
  describe 'Check Self Editor Privileges' do 
    include_examples 'Self Editing: Check Self Editor Privileges' 
  end
  describe 'Restrict Logins' do 
    include_examples 'Self Editing: Restrict Logins' 
  end
  describe 'Delete New Self Editor User' do 
    include_examples 'Self Editing: Delete New Self Editor User' 
  end
  describe 'Delete Faculty Info' do 
    include_examples 'Self Editing: Delete Faculty Info' 
  end
  describe 'Create New Self Editor User2' do 
    include_examples 'Self Editing: Create New Self Editor User2' 
  end
  describe 'First Time Self Editor Login2' do 
    include_examples 'Self Editing: First Time Self Editor Login2' 
  end
  describe 'Try New Self Editor Password2' do 
    include_examples 'Self Editing: Try New Self Editor Password2' 
  end
  describe 'Create Faculty Member' do 
    include_examples 'Self Editing: Create Faculty Member' 
  end
  describe 'Add Self Editor Id2' do 
    include_examples 'Self Editing: Add Self Editor Id2' 
  end
  describe 'Check Self Editor Privileges' do 
    include_examples 'Self Editing: Check Self Editor Privileges' 
  end
  describe 'Delete New Self Editor User' do 
    include_examples 'Self Editing: Delete New Self Editor User' 
  end
  describe 'Delete Faculty Info' do 
    include_examples 'Self Editing: Delete Faculty Info' 
  end
end