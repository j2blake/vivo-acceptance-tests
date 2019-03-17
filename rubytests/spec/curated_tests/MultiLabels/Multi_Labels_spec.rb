require_relative '../../configuration'
require_relative '_add_r_d_f_data.rb'
require_relative '_manage_labels.rb'
require_relative '_remove_r_d_f_data.rb'

describe 'Multi Labels' do
  describe 'Add R D F Data' do 
    include_examples 'Multi Labels: Add R D F Data' 
  end
  describe 'Manage Labels' do 
    include_examples 'Multi Labels: Manage Labels' 
  end
  describe 'Remove R D F Data' do 
    include_examples 'Multi Labels: Remove R D F Data' 
  end
end