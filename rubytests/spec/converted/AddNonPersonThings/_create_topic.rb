shared_examples "Add Non Person Things: Create Topic" do
  it "Validate adding Topic" do
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
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Concept (skos)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Concept")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Select to add then enter empty field" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Concept (skos)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Concept")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please enter a value in the Name field.")
  end

  it "Now enter something in the field" do
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Health")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health")
  end

  it "Test overview entry (image and webpage have been tested)" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:xpath, ".//h3[@id='broader']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Animal Health")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health")
  end

  it "Test other entry" do
    $browser.find_element(:xpath, ".//h3[@id='narrower']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create \"narrower concept\" entry for Primate Health")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Diet")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health")
    $browser.find_element(:xpath, ".//h3[@id='related']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create \"related concept\" entry for Primate Health")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Ape Health")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health")
  end

  it "Verify everything entered is displaying properly" do
    $browser.find_element(:link_text, "Animal Health")
    $browser.find_element(:link_text, "Primate Diet")
    $browser.find_element(:link_text, "Ape Health")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
