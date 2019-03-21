require 'fileutils'

require_relative '../../configuration'

describe 'Sparql Update API DISABLED' do
  #
  # Modify VIVO to include a helper page.
  #
  def before_starting_server
    page = File.expand_path("TestSparqlApi.html", File.dirname(__FILE__))
    page_target = File.expand_path("vivo_context", $settings.output_path)
    FileUtils.copy(page, page_target)
  end

  describe 'Test API Disabled' do
    it "Check that API is disabled by default" do
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:css, "input[type=\"submit\"]").click
      expect(browser_page_text).to include("403 Account is not authorized")
    end
  end
end
