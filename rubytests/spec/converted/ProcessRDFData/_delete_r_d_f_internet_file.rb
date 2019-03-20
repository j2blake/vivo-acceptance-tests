shared_examples "Process R D F Data: Delete R D F Internet File" do
  it "Delete Internet RDF file" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Select Add/Remove RDF data option from Site Admin page" do
    $browser.find_element(:link_text, "Add/Remove RDF data").click
    expect($browser.title).to eq("Ingest RDF Data")
  end

  it "Indicate which RDF file should be deleted" do
    $browser.find_element(:name, "rdfUrl").clear
    $browser.find_element(:name, "rdfUrl").send_keys("http://www.geonames.org/ontology/ontology_v2.0_Lite.rdf")
    $browser.find_element(:xpath, ".//input[@name='mode' and @value='remove']").click
    $browser.find_element(:xpath, ".//input[@name='submit' and @value='submit']").click
    expect($browser.title).to eq("Ingest RDF Data")
  end

  it "Verify RDF file was deleted" do
    expect(browser_page_text).to include("Removed RDF from http://www.geonames.org/ontology/ontology_v2.0_Lite.rdf.")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
