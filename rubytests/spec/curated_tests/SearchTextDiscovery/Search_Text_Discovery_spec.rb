require_relative '../../configuration'
require_relative '_text_discovery.rb'
require_relative '_delete_stuff.rb'

describe 'Search Text Discovery' do
  describe 'Text Discovery' do 
    include_examples 'Search Text Discovery: Text Discovery' 
  end
  describe 'Delete Stuff' do 
    include_examples 'Search Text Discovery: Delete Stuff' 
  end
end