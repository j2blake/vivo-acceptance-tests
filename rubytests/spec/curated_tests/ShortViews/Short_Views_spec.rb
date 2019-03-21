require 'fileutils'

require_relative '../../configuration'
require_relative '_create_test_departments.rb'
require_relative '_create_test_people.rb'
require_relative '_check_results.rb'
require_relative '_delete_test_people.rb'
require_relative '_delete_test_departments.rb'

describe 'Short Views' do
  #
  # Modify VIVO to include the short view configuration file, and the Freemarker 
  # templates that it uses.
  #
  def before_starting_server
    config = File.expand_path("shortview_config.n3", File.dirname(__FILE__))
    config_target = File.expand_path("vivo_context/WEB-INF/resources", $settings.output_path)
    FileUtils.copy(config, config_target)

    templates = []
    templates << File.expand_path("view-browse-faculty.ftl", File.dirname(__FILE__))
    templates << File.expand_path("view-index-department.ftl", File.dirname(__FILE__))
    templates << File.expand_path("view-index-faculty.ftl", File.dirname(__FILE__))
    templates << File.expand_path("view-search-faculty.ftl", File.dirname(__FILE__))
    template_target = File.expand_path("vivo_context/themes/wilma/templates", $settings.output_path)
    FileUtils.copy(templates, template_target)
  end

  describe 'Create Test Departments' do
    include_examples 'Short Views: Create Test Departments'
  end
  describe 'Create Test People' do
    include_examples 'Short Views: Create Test People'
  end
  describe 'Check Results' do
    include_examples 'Short Views: Check Results'
  end
  describe 'Delete Test People' do
    include_examples 'Short Views: Delete Test People'
  end
  describe 'Delete Test Departments' do
    include_examples 'Short Views: Delete Test Departments'
  end
end