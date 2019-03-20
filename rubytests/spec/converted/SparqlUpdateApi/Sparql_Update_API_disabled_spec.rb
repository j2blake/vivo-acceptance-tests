require_relative '../../configuration'

describe 'Sparql Update API DISABLED' do
  describe 'Test API Disabled' do
    it "Check that API is disabled by default" do
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:css, "input[type=\"submit\"]").click
      expect(browser_page_text).to include("403 Account is not authorized")
    end
  end
end
