shared_examples "Create Properties: Add Obj Prop Year Founded" do
  it "Add Object Property year founded to Property Group Place" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Object Properties" do
    $browser.find_element(:link_text, "Object property hierarchy").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify visiting hours does not already exist" do
    expect($browser.find_elements(:link_text, "year founded").size).to eq(0)
    $browser.find_element(:xpath, ".//input[@value='Add new object property']").click
    expect($browser.title).to eq("Property Editing Form")
  end

  it "Add visiting hours" do
    browser_find_select_list(:name, "ParentURI").select_by(:text, "date/time interval (vivo)")
    browser_find_select_list(:name, "GroupURI").select_by(:text, "Place")
    browser_find_select_list(:name, "Namespace").select_by(:text, "Bibliographic Ontology")
    $browser.find_element(:name, "LocalName").clear
    $browser.find_element(:name, "LocalName").send_keys("yearFounded")
    $browser.find_element(:name, "DomainPublic").clear
    $browser.find_element(:name, "DomainPublic").send_keys("year founded")
    browser_find_select_list(:name, "NamespaceInverse").select_by(:text, "Bibliographic Ontology")
    $browser.find_element(:name, "LocalNameInverse").clear
    $browser.find_element(:name, "LocalNameInverse").send_keys("yearFoundedFor")
    $browser.find_element(:name, "RangePublic").clear
    $browser.find_element(:name, "RangePublic").send_keys("year founded for")
    browser_find_select_list(:name, "DomainVClassURI").select_by(:text, "Museum (vivo)")
    browser_find_select_list(:name, "RangeVClassURI").select_by(:text, "Date/Time Interval (vivo)")
    browser_find_select_list(:name, "HiddenFromDisplayBelowRoleLevelUsingRoleUri").select_by(:text, "editor and above")
    browser_find_select_list(:name, "ProhibitedFromUpdateBelowRoleLevelUsingRoleUri").select_by(:text, "self-editor and above")
    browser_find_select_list(:name, "HiddenFromPublishBelowRoleLevelUsingRoleUri").select_by(:text, "all users, including public")
    $browser.find_element(:name, "DomainDisplayTier").clear
    $browser.find_element(:name, "DomainDisplayTier").send_keys("100")
    $browser.find_element(:name, "OfferCreateNewOption").click
    $browser.find_element(:name, "CustomEntryForm").clear
    $browser.find_element(:name, "CustomEntryForm").send_keys("edu.cornell.mannlib.vitro.webapp.edit.n3editing.configuration.generators.DateTimeIntervalFormGenerator")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Object Property Control Panel")
  end

  it "Verify visiting hours has been properly added" do
    expect(browser_page_text).to include("year founded (bibo)")
    $browser.find_element(:link_text, "date/time interval (vivo)")
    expect(browser_page_text).to include("Place")
    expect(browser_page_text).to include("Bibliographic Ontology")
    expect(browser_page_text).to include("yearFounded")
    expect(browser_page_text).to include("year founded")
    $browser.find_element(:link_text, "Museum (vivo)")
    $browser.find_element(:link_text, "Date/Time Interval (vivo)")
    expect(browser_page_text).to include("false")
    expect(browser_page_text).to include("editor and above")
    expect(browser_page_text).to include("self-editor and above")
    expect(browser_page_text).to include("property: 100, inverse: -1")
    expect(browser_page_text).to include("edu.cornell.mannlib.vitro.webapp.edit.n3editing.configuration.generators.DateTimeIntervalFormGenerator")
    expect(browser_page_text).to include("true")
    expect(browser_page_text).to include("ascending")
    expect(browser_page_text).to include("http://purl.org/ontology/bibo/yearFounded")
    expect(browser_page_text).to include("all users, including public")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
