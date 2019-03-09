require_relative '../../configuration'
require_relative '_create_new_self_editor_user.rb'
require_relative '_first_time_self_editor_login.rb'
require_relative '_try_new_self_editor_password.rb'
require_relative '_check_self_editor_privileges.rb'
require_relative '_create_new_curator_user.rb'
require_relative '_first_time_curator_login.rb'
require_relative '_check_curator_privileges.rb'
require_relative '_check_curator_login_logout.rb'
require_relative '_create_new_editor_user.rb'
require_relative '_first_time_editor_login.rb'
require_relative '_check_editor_privileges.rb'
require_relative '_check_editor_login_logout.rb'
require_relative '_delete_new_curator_user.rb'
require_relative '_delete_new_editor_user.rb'
require_relative '_delete_new_self_editor_user.rb'

describe 'Create Accounts' do
  describe 'Create New Self Editor User' do 
    include_examples 'Create Accounts: Create New Self Editor User' 
  end
  describe 'First Time Self Editor Login' do 
    include_examples 'Create Accounts: First Time Self Editor Login' 
  end
  describe 'Try New Self Editor Password' do 
    include_examples 'Create Accounts: Try New Self Editor Password' 
  end
  describe 'Check Self Editor Privileges' do 
    include_examples 'Create Accounts: Check Self Editor Privileges' 
  end
  describe 'Create New Curator User' do 
    include_examples 'Create Accounts: Create New Curator User' 
  end
  describe 'First Time Curator Login' do 
    include_examples 'Create Accounts: First Time Curator Login' 
  end
  describe 'Check Curator Privileges' do 
    include_examples 'Create Accounts: Check Curator Privileges' 
  end
  describe 'Check Curator Login Logout' do 
    include_examples 'Create Accounts: Check Curator Login Logout' 
  end
  describe 'Create New Editor User' do 
    include_examples 'Create Accounts: Create New Editor User' 
  end
  describe 'First Time Editor Login' do 
    include_examples 'Create Accounts: First Time Editor Login' 
  end
  describe 'Check Editor Privileges' do 
    include_examples 'Create Accounts: Check Editor Privileges' 
  end
  describe 'Check Editor Login Logout' do 
    include_examples 'Create Accounts: Check Editor Login Logout' 
  end
  describe 'Delete New Curator User' do 
    include_examples 'Create Accounts: Delete New Curator User' 
  end
  describe 'Delete New Editor User' do 
    include_examples 'Create Accounts: Delete New Editor User' 
  end
  describe 'Delete New Self Editor User' do 
    include_examples 'Create Accounts: Delete New Self Editor User' 
  end
end