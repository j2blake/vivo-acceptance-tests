require_relative '../../configuration'
require_relative '_add_r_d_f_data.rb'
require_relative '_check_english_overview.rb'
require_relative '_check_german_overview.rb'
require_relative '_check_english_overview.rb'
require_relative '_remove_r_d_f_data.rb'

describe 'Language Support' do
  describe 'Add R D F Data' do 
    include_examples 'Language Support: Add R D F Data' 
  end
  describe 'Check English Overview' do 
    include_examples 'Language Support: Check English Overview' 
  end
  describe 'Check German Overview' do 
    include_examples 'Language Support: Check German Overview' 
  end
  describe 'Check English Overview' do 
    include_examples 'Language Support: Check English Overview' 
  end
  describe 'Remove R D F Data' do 
    include_examples 'Language Support: Remove R D F Data' 
  end
end