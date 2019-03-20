shared_examples "Add Non Person Things: Create Location" do
  it "Validate adding Location" do
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
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Building (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Building")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Select to add then enter empty field" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Building (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Building")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please enter a value in the Name field.")
  end

  it "Now enter something in the field" do
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Jane Memorial Building")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Jane Memorial Building")
  end

  it "Test location entry" do
    $browser.find_element(:css, "a.add-BFO_0000051 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("There are no entries in the system from which to select.")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create \"rooms\" entry for Jane Memorial Building")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Lab Admin Office")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Jane Memorial Building")
    $browser.find_element(:css, "a.add-BFO_0000050 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Geographic Location (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Quad")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Jane Memorial Building")
  end

  it "Test other entry" do
    $browser.find_element(:css, "a.add-RO_0001015 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Jane Memorial Building")
  end

  it "Test remaining fields (added for 1.6)" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[3]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Heart Health (Service)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Jane Memorial Building")
    $browser.find_element(:xpath, "(.//h3[@id='RO_0001015']/a)[3]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate University of America (University)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Jane Memorial Building")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[5]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Health Check (Event)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Jane Memorial Building")
  end

  it "Verify everything entered is displaying properly" do
    $browser.find_element(:link_text, "Portable Primate Habitat")
    $browser.find_element(:link_text, "Primate Heart Health")
    $browser.find_element(:link_text, "Primate University of America")
    $browser.find_element(:link_text, "Primate Health Check")
    $browser.find_element(:link_text, "Lab Admin Office")
    $browser.find_element(:link_text, "Primate Quad")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
