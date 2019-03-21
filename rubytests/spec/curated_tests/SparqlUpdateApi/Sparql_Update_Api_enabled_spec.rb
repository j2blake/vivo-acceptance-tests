require_relative '../../configuration'

describe 'Sparql Update API Enabled' do
  #
  # Modify VIVO to include a helper page, and to enable the SPARQL Update API.
  #
  def before_starting_server
    page = File.expand_path("TestSparqlApi.html", File.dirname(__FILE__))
    page_target = File.expand_path("vivo_context", $settings.output_path)
    FileUtils.copy(page, page_target)

    rdf = File.expand_path("EnableSparqlUpdateApi.n3", File.dirname(__FILE__))
    rdf_target = File.expand_path("home/rdf/auth/everytime", $settings.output_path)
    FileUtils.copy(rdf, rdf_target)
  end

  describe 'Test API Works' do
    it "Check that API works" do
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:css, "input[type=\"submit\"]").click
      expect(browser_page_text).to include("200 SPARQL update accepted.")
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:link_text, "Get RDF").click
    end

    it "During pause check that RDF is displayed" do
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:xpath, ".//input[@value='Successful DELETE']").click
      expect(browser_page_text).to include("200 SPARQL update accepted.")
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:link_text, "Get RDF").click
      expect($browser.title).to eq("Individual not found")
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
    end
  end
  
  describe 'Test API Failure' do
    it "Check API failure conditions" do
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:xpath, ".//input[@value='GET method not allowed']").click
      expect(browser_page_text).to include("HTTP ERROR 405")
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:xpath, ".//input[@value='Email and password missing']").click
      expect(browser_page_text).to include("403 email/password combination is not valid")
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:xpath, ".//input[@value='No such user']").click
      expect(browser_page_text).to include("403 email/password combination is not valid")
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:xpath, ".//input[@value='Wrong password']").click
      expect(browser_page_text).to include("403 email/password combination is not valid")
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:xpath, ".//input[@value='Account not authorized']").click
      expect(browser_page_text).to include("403 Account is not authorized")
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:xpath, ".//input[@value='SPARQL is invalid']").click
      expect(browser_page_text).to include("400 Failed to parse SPARQL update")
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
      $browser.find_element(:xpath, ".//input[@value=\"SPARQL doesn't specify a GRAPH\"]").click
      expect(browser_page_text).to include("400 SPARQL update must specify a GRAPH")
      $browser.navigate.to vivo_url("/TestSparqlApi.html")
    end
  end
end