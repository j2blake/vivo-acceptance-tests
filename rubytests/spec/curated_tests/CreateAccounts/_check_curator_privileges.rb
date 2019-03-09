shared_examples "Create Accounts: Check Curator Privileges" do
  it "Check Curator priviledges" do
  end

  it "Must not be logged in already" do
  end

  it "Log in as Connie Curator" do
    vivo_login_from_home_page_as("ConnieCurator@mydomain.edu", "newPassword")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Check privileges: should see Data Input, Ontology Editor, Site Configuration, Advanced Data Tools." do
    expect(browser_page_text).to include("Data Input")
    expect(browser_page_text).to include("Site Configuration")
    $browser.find_element(:link_text, "Site information")
    expect($browser.find_elements(:link_text, "Institutional internal class").size).to eq(0)
    expect($browser.find_elements(:link_text, "Manage profile editing").size).to eq(0)
    expect($browser.find_elements(:link_text, "Menu management").size).to eq(0)
    expect($browser.find_elements(:link_text, "User accounts").size).to eq(0)
    expect($browser.find_elements(:link_text, "Startup Status").size).to eq(0)
    expect(browser_page_text).to include("Ontology Editor")
    $browser.find_element(:link_text, "Ontology list")
    expect(browser_page_text).to include("Class Management")
    $browser.find_element(:link_text, "Class hierarchy")
    $browser.find_element(:link_text, "Class groups")
    expect(browser_page_text).to include("Property Management")
    $browser.find_element(:link_text, "Object property hierarchy")
    $browser.find_element(:link_text, "Data property hierarchy")
    $browser.find_element(:link_text, "Property groups")
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

  it "Check links actually work" do
    $browser.find_element(:link_text, "Site information").click
    expect($browser.title).to eq("Site Information")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Class groups").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Class hierarchy").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Data property hierarchy").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Object property hierarchy").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Property groups").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Ontology list").click
    expect($browser.title).to eq("Ontologies")
    expect(browser_page_text).not_to include("We're sorry, but you are not authorized to view the page you requested. If you think this is an error, please contact us and we'll be happy to help.")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
