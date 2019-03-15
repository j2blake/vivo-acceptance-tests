require_relative '../../configuration'
require_relative '_add_ontology.rb'
require_relative '_delete_ontology.rb'

describe 'Ontology Management' do
  describe 'Add Ontology' do 
    include_examples 'Ontology Management: Add Ontology' 
  end
  describe 'Delete Ontology' do 
    include_examples 'Ontology Management: Delete Ontology' 
  end
end