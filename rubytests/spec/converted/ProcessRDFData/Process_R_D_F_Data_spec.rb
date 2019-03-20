require_relative '../../configuration'
require_relative '_add_r_d_f_internet_file.rb'
require_relative '_delete_r_d_f_internet_file.rb'
require_relative '_add_r_d_f_local_file.rb'
require_relative '_delete_r_d_f_local_file.rb'
require_relative '_export_r_d_f_file.rb'

describe 'Process R D F Data' do
  describe 'Add R D F Internet File' do 
    include_examples 'Process R D F Data: Add R D F Internet File' 
  end
  describe 'Delete R D F Internet File' do 
    include_examples 'Process R D F Data: Delete R D F Internet File' 
  end
  describe 'Add R D F Local File' do 
    include_examples 'Process R D F Data: Add R D F Local File' 
  end
  describe 'Delete R D F Local File' do 
    include_examples 'Process R D F Data: Delete R D F Local File' 
  end
  describe 'Export R D F File' do 
    include_examples 'Process R D F Data: Export R D F File' 
  end
end