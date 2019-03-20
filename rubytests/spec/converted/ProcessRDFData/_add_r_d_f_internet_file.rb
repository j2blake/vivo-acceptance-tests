shared_examples "Process R D F Data: Add R D F Internet File" do
  it "Add RDF file from an Internet location" do
  end

  it "Must not be logged on" do
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

  it "Select RDF file to be added" do
    $browser.find_element(:name, "rdfUrl").clear
    $browser.find_element(:name, "rdfUrl").send_keys("http://www.geonames.org/ontology/ontology_v2.0_Lite.rdf")
    $browser.find_element(:name, "makeClassgroups").click
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Ingest RDF Data")
  end

  it "Verify add was successful" do
    expect(browser_page_text).to include("RDF upload successful.")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
