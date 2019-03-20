require_relative '../../configuration'
require_relative '_create_new_proxy_editors.rb'
require_relative '_create_new_librarian.rb'
require_relative '_create_new_faculty_member.rb'
require_relative '_create_new_self_editor_user.rb'
require_relative '_validate_admin_proxy.rb'
require_relative '_validate_admin_proxy2.rb'
require_relative '_delete_admin_proxy.rb'
require_relative '_validate_user_proxy.rb'
require_relative '_delete_user_proxy.rb'
require_relative '_delete_new_users.rb'
require_relative '_delete_new_people.rb'

describe 'Proxy Editing' do
  describe 'Create New Proxy Editors' do 
    include_examples 'Proxy Editing: Create New Proxy Editors' 
  end
  describe 'Create New Librarian' do 
    include_examples 'Proxy Editing: Create New Librarian' 
  end
  describe 'Create New Faculty Member' do 
    include_examples 'Proxy Editing: Create New Faculty Member' 
  end
  describe 'Create New Self Editor User' do 
    include_examples 'Proxy Editing: Create New Self Editor User' 
  end
  describe 'Validate Admin Proxy' do 
    include_examples 'Proxy Editing: Validate Admin Proxy' 
  end
  describe 'Validate Admin Proxy2' do 
    include_examples 'Proxy Editing: Validate Admin Proxy2' 
  end
  describe 'Delete Admin Proxy' do 
    include_examples 'Proxy Editing: Delete Admin Proxy' 
  end
  describe 'Validate User Proxy' do 
    include_examples 'Proxy Editing: Validate User Proxy' 
  end
  describe 'Delete User Proxy' do 
    include_examples 'Proxy Editing: Delete User Proxy' 
  end
  describe 'Delete New Users' do 
    include_examples 'Proxy Editing: Delete New Users' 
  end
  describe 'Delete New People' do 
    include_examples 'Proxy Editing: Delete New People' 
  end
end