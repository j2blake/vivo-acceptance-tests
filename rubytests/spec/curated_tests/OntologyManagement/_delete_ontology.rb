shared_examples "Ontology Management: Delete Ontology" do
  it "Delete added ontology to clean up from test" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Ontology List" do
    $browser.find_element(:link_text, "Ontology list").click
    expect($browser.title).to eq("Ontologies")
  end

  it "Make sure SWRC exists" do
    expect(browser_page_text).to include("SWRC")
    $browser.find_element(:link_text, "SWRC").click
    expect($browser.title).to eq("Ontology Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit SWRC']").click
    expect($browser.title).to eq("Ontology Editing Form")
  end

  it "Delete the SWRC ontology" do
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this record? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("Ontologies")
  end

  it "Verify SWRC no longer exists" do
    expect(browser_page_text).not_to include("SWRC")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
