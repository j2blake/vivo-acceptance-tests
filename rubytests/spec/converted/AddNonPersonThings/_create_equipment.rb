shared_examples "Add Non Person Things: Create Equipment" do
  it "Validate adding Equipment" do
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
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Equipment (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Equipment")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Select to add then enter empty field" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Equipment (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Equipment")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please enter a value in the Name field.")
  end

  it "Now enter something in the field" do
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Feeder")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Feeder")
  end

  it "Test overview entry (image and webpage have been tested)" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:xpath, ".//h3[@id='equipmentFor']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Research Laboratory (Laboratory)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Feeder")
  end

  it "Test location entry" do
    $browser.find_element(:css, "a.add-RO_0001025 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Facility (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create \"housed in facility\" entry for Primate Feeder")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Research Lab Room 123")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Feeder")
  end

  it "Test other entry" do
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: keywords")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Animal Diet")
    $browser.find_element(:id, "submit").click
    $browser.find_element(:link_text, "Primate Research Lab Room 123").click
    expect($browser.title).to eq("Primate Research Lab Room 123")
  end

  it "Test remaining fields (added for 1.6)" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[3]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Heart Health (Service)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Research Lab Room 123")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[4]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate University of America (University)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Research Lab Room 123")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[5]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Health Check (Event)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Research Lab Room 123")
    $browser.find_element(:css, "a.add-BFO_0000050 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("United State")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Research Lab Room 123")
  end

  it "Verify everything entered is displaying properly" do
    $browser.find_element(:link_text, "Primate Feeder")
    $browser.find_element(:link_text, "Primate Heart Health")
    $browser.find_element(:link_text, "Primate University of America")
    $browser.find_element(:link_text, "Primate Health Check")
    $browser.find_element(:link_text, "United States of America")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
