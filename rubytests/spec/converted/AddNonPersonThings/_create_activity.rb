shared_examples "Add Non Person Things: Create Activity" do
  it "Validate adding Activity" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    expect(browser_page_text).to include("Data Input")
  end

  it "Select to add then cancel right away" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Grant (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Grant")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Select to add then enter empty field" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Grant (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Grant")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please enter a value in the Name field.")
  end

  it "Now enter something in the field" do
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Elderly Care")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
  end

  it "Test overview entry (image and webpage have been tested)" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    expect($browser.title).to eq("Primate Elderly Care")
    $browser.find_element(:css, "a.add-relates > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "organization").send_keys("primate colleges of the wor")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Primate Elderly Care")
    $browser.find_element(:css, "a.add-assignedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Research Laboratory (Laboratory)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
    $browser.find_element(:xpath, ".//h3[@id='abstract']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: abstract")
    browser_fill_tinyMCE("Purpose of grant is to determine the appropriate environment, physical activity, and diet for primates as they age.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
    $browser.find_element(:xpath, ".//h3[@id='grantSubcontractedThrough']/a").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Colleges of the World (Consortium)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
    $browser.find_element(:xpath, ".//h3[@id='totalAwardAmount']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: total award amount")
    browser_fill_tinyMCE("$1,234,567")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
    $browser.find_element(:xpath, ".//h3[@id='grantDirectCosts']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("$999,999")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
    $browser.find_element(:xpath, ".//h3[@id='sponsorAwardId']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("1234-5678")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
  end

  it "Test geographic focus" do
    $browser.find_element(:xpath, ".//h3[@id='geographicFocus']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("Afri")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
  end

  it "Test time entry" do
    $browser.find_element(:xpath, ".//h3[@id='dateTimeInterval']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2010")
    browser_find_select_list(:id, "startField-month").select_by(:text, "9")
    browser_find_select_list(:id, "startField-day").select_by(:text, "1")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2012")
    browser_find_select_list(:id, "endField-month").select_by(:text, "8")
    browser_find_select_list(:id, "endField-day").select_by(:text, "31")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
  end

  it "Test identity entry" do
    $browser.find_element(:xpath, ".//h3[@id='localAwardId']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: local award ID")
    browser_fill_tinyMCE("P999-1234")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
  end

  it "Test other entry" do
    $browser.find_element(:css, "a.add-fundingVehicleFor > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("primate health chec")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
    $browser.find_element(:xpath, ".//h3[@id='hasSubjectArea']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Manage Concepts")
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:link_text, "Select or create a VIVO-defined concept.").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "relatedIndLabel").clear
    $browser.find_element(:id, "relatedIndLabel").send_keys("Elderly Care")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Primate Elderly Care")
  end

  it "Test remaining fields (added for 1.6)" do
    $browser.find_element(:css, "a.add-BFO_0000051 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Habitat Research Grant")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
    $browser.find_element(:css, "a.add-BFO_0000050 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Survival Planning Grant")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
    $browser.find_element(:css, "a.add-supportedInformationResource").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Info (Database)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Elderly Care")
  end

  it "Verify everything entered is displaying properly" do
    expect(browser_page_text).to include("Primate Elderly Care")
    expect(browser_page_text).to include("Grant")
    expect(browser_page_text).to include("Purpose of grant is to determine the appropriate environment, physical activity, and diet for primates as they age.")
    expect(browser_page_text).to include("September 1, 2010 - August 31, 2012")
    $browser.find_element(:link_text, "Elderly Care")
    $browser.find_element(:link_text, "Primate Research Laboratory")
    $browser.find_element(:link_text, "Primate Colleges of the World")
    $browser.find_element(:link_text, "Primate Colleges of the World")
    $browser.find_element(:link_text, "Africa")
    $browser.find_element(:link_text, "Elderly Care")
    $browser.find_element(:link_text, "Primate Habitat Research Grant")
    $browser.find_element(:link_text, "Primate Survival Planning Grant")
    expect(browser_page_text).to include("$1,234,567")
    expect(browser_page_text).to include("$999,999")
    $browser.find_element(:xpath, "(.//a[contains(text(),'Africa')])[2]")
    expect(browser_page_text).to include("1234-5678")
    expect(browser_page_text).to include("P999-1234")
    $browser.find_element(:link_text, "Primate Info")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
