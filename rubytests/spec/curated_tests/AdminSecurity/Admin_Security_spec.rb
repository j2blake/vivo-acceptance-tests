require_relative '../../configuration'
require_relative '_admin_bad_login.rb'
require_relative '_admin_login_logout.rb'
require_relative '_admin_change_password.rb'
require_relative '_new_admin_account.rb'
require_relative '_new_admin_first_login.rb'
require_relative '_new_admin_check_privileges.rb'
require_relative '_new_admin_delete.rb'

describe 'Admin Security' do
  describe 'Admin Bad Login' do 
    include_examples 'Admin Security: Admin Bad Login' 
  end
  describe 'Admin Login Logout' do 
    include_examples 'Admin Security: Admin Login Logout' 
  end
  describe 'Admin Change Password' do 
    include_examples 'Admin Security: Admin Change Password' 
  end
  describe 'New Admin Account' do 
    include_examples 'Admin Security: New Admin Account' 
  end
  describe 'New Admin First Login' do 
    include_examples 'Admin Security: New Admin First Login' 
  end
  describe 'New Admin Check Privileges' do 
    include_examples 'Admin Security: New Admin Check Privileges' 
  end
  describe 'New Admin Delete' do 
    include_examples 'Admin Security: New Admin Delete' 
  end
end