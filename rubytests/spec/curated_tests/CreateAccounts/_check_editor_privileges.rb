shared_examples "Create Accounts: Check Editor Privileges" do
  it "Check Editor privileges" do
  end

  it "Must not be logged in" do
  end

  it "Log in as Eddie Editor" do
    vivo_login_from_home_page_as("EddieEditor@mydomain.edu", "newPassword")
  end

  it "Check privileges: should see Data Input, should not see Ontology Editor, Site Configuration, Advanced Data Tools" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    expect(browser_page_text).to include("Data Input")
    expect(browser_page_text).not_to include("Site Configuration")
    expect($browser.find_elements(:link_text, "Manage Profile Editing").size).to eq(0)
    expect($browser.find_elements(:link_text, "Site information").size).to eq(0)
    expect($browser.find_elements(:link_text, "Menu management").size).to eq(0)
    expect($browser.find_elements(:link_text, "Institutional internal class").size).to eq(0)
    expect($browser.find_elements(:link_text, "User accounts").size).to eq(0)
    expect($browser.find_elements(:link_text, "Startup Status").size).to eq(0)
    expect(browser_page_text).not_to include("Ontology Editor")
    expect($browser.find_elements(:link_text, "Ontology list").size).to eq(0)
    expect(browser_page_text).not_to include("Class Management")
    expect($browser.find_elements(:link_text, "Class hierarchy").size).to eq(0)
    expect($browser.find_elements(:link_text, "Class groups").size).to eq(0)
    expect(browser_page_text).not_to include("Property Management")
    expect($browser.find_elements(:link_text, "Object property hierarchy").size).to eq(0)
    expect($browser.find_elements(:link_text, "Data property hierarchy").size).to eq(0)
    expect($browser.find_elements(:link_text, "Property groups").size).to eq(0)
    expect(browser_page_text).not_to include("Advanced Data Tools")
    expect($browser.find_elements(:link_text, "Ingest tools").size).to eq(0)
    expect($browser.find_elements(:link_text, "Add/Remove RDF data").size).to eq(0)
    expect($browser.find_elements(:link_text, "RDF export").size).to eq(0)
    expect($browser.find_elements(:link_text, "SPARQL query").size).to eq(0)
    expect(browser_page_text).not_to include("Refresh Content")
    expect($browser.find_elements(:link_text, "Rebuild search index").size).to eq(0)
    expect($browser.find_elements(:link_text, "Rebuild class group cache").size).to eq(0)
    expect($browser.find_elements(:link_text, "Rebuild visualization cache").size).to eq(0)
    expect($browser.find_elements(:link_text, "Recompute inferences").size).to eq(0)
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
