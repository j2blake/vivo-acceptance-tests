shared_examples "Ontology Management: Add Ontology" do
  it "Add SWRC ontology" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Ontology List" do
    $browser.find_element(:link_text, "Ontology list").click
    expect($browser.title).to eq("Ontologies")
    expect(browser_page_text).to include("Ontology")
    expect(browser_page_text).to include("Namespace")
    expect(browser_page_text).to include("Prefix")
  end

  it "Make sure SWRC does not already exist" do
    expect(browser_page_text).not_to include("SWRC")
    $browser.find_element(:xpath, ".//input[@value='Add new ontology']").click
    expect($browser.title).to eq("Ontology Editing Form")
  end

  it "Add SWRC" do
    $browser.find_element(:name, "Name").clear
    $browser.find_element(:name, "Name").send_keys("SWRC")
    $browser.find_element(:name, "URI").clear
    $browser.find_element(:name, "URI").send_keys("http://swrc.ontoware.org/ontology")
    $browser.find_element(:name, "Prefix").clear
    $browser.find_element(:name, "Prefix").send_keys("swrc")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Ontology Control Panel")
  end

  it "Verify that SWRC has been added" do
    expect(browser_page_text).to include("SWRC")
    expect(browser_page_text).to include("http://swrc.ontoware.org/ontology#")
    expect(browser_page_text).to include("swrc")
    $browser.find_element(:xpath, ".//input[@value='All Ontologies']").click
    expect($browser.title).to eq("Ontologies")
    expect(browser_page_text).to include("SWRC")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
