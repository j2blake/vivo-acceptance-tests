require_relative '../../configuration'
require_relative '_add_test_r_d_f.rb'
require_relative '_test_user_created.rb'
require_relative '_test_various_requests.rb'
require_relative '_check_data_hiding.rb'
require_relative '_remove_test_r_d_f.rb'

describe 'Linked Open Data' do
  describe 'Add Test R D F' do 
    include_examples 'Linked Open Data: Add Test R D F' 
  end
  describe 'Test User Created' do 
    include_examples 'Linked Open Data: Test User Created' 
  end
  describe 'Test Various Requests' do 
    include_examples 'Linked Open Data: Test Various Requests' 
  end
  describe 'Check Data Hiding' do 
    include_examples 'Linked Open Data: Check Data Hiding' 
  end
  describe 'Remove Test R D F' do 
    include_examples 'Linked Open Data: Remove Test R D F' 
  end
end