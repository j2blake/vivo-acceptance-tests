shared_examples "Create Properties: Add Data Prop Arch Details" do
  it "Add Data Property of architectual details to the Place Propery Group" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Data Property Hierarchy" do
    $browser.find_element(:link_text, "Data property hierarchy").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify that architectural details does not already exist" do
    expect($browser.find_elements(:link_text, "architectural details").size).to eq(0)
    $browser.find_element(:xpath, ".//input[@value='Add new data property']").click
    expect($browser.title).to eq("Data Property Editing Form")
  end

  it "Add architectural details" do
    $browser.find_element(:name, "PublicName").clear
    $browser.find_element(:name, "PublicName").send_keys("architectural details")
    browser_find_select_list(:name, "GroupURI").select_by(:text, "Place")
    browser_find_select_list(:name, "Namespace").select_by(:text, "VIVO Core Ontology")
    browser_find_select_list(:name, "HiddenFromDisplayBelowRoleLevelUsingRoleUri").select_by(:text, "self-editor and above")
    browser_find_select_list(:name, "ProhibitedFromUpdateBelowRoleLevelUsingRoleUri").select_by(:text, "editor and above")
    browser_find_select_list(:name, "HiddenFromPublishBelowRoleLevelUsingRoleUri").select_by(:text, "curator and above")
    $browser.find_element(:name, "LocalName").clear
    $browser.find_element(:name, "LocalName").send_keys("architecturalDetails")
    browser_find_select_list(:name, "DomainClassURI").select_by(:text, "Agent (foaf)")
    browser_find_select_list(:name, "RangeDatatypeURI").select_by(:text, "string")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Data Property Control Panel")
  end

  it "Verify that architectural details has been added properly" do
    expect(browser_page_text).to include("Data Property Control Panel")
    expect(browser_page_text).to include("architectural details (vivo)")
    expect(browser_page_text).to include("Place")
    expect(browser_page_text).to include("VIVO Core Ontology")
    expect(browser_page_text).to include("architecturalDetails")
    $browser.find_element(:link_text, "Agent (foaf)")
    expect(browser_page_text).to include("http://www.w3.org/2001/XMLSchema#string")
    expect(browser_page_text).to include("false")
    expect(browser_page_text).to include("self-editor and above")
    expect(browser_page_text).to include("editor and above")
    expect(browser_page_text).to include("-1")
    expect(browser_page_text).to include("(unspecified)")
    expect(browser_page_text).to include("http://vivoweb.org/ontology/core#architecturalDetails")
    expect(browser_page_text).to include("curator and above")
  end

  it "Check data properties hierarchy" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Data property hierarchy").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "architectural details (vivo)")
    expect(browser_page_text).to include("architectural details (vivo)")
    expect(browser_page_text).to include("Place")
    expect(browser_page_text).to include("Agent (foaf)")
    expect(browser_page_text).to include("string")
    $browser.find_element(:link_text, "architectural details (vivo)").click
    expect($browser.title).to eq("Data Property Control Panel")
    expect(browser_page_text).to include("architectural details (vivo)")
    expect(browser_page_text).to include("architectural details")
    expect(browser_page_text).to include("Place")
    expect(browser_page_text).to include("VIVO Core Ontology")
    expect(browser_page_text).to include("architecturalDetails")
    $browser.find_element(:link_text, "Agent (foaf)")
    expect(browser_page_text).to include("http://www.w3.org/2001/XMLSchema#string")
    expect(browser_page_text).to include("false")
    expect(browser_page_text).to include("self-editor and above")
    expect(browser_page_text).to include("editor and above")
    expect(browser_page_text).to include("-1")
    expect(browser_page_text).to include("(unspecified)")
    expect(browser_page_text).to include("http://vivoweb.org/ontology/core#architecturalDetails")
    expect(browser_page_text).to include("curator and above")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
