shared_examples "Initial Setup: Create H T M L Page" do
  it "Create HTML menu page" do
  end

  it "Must be logged out" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Menu Management" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Page management").click
    expect($browser.title).to eq("Pages")
  end

  it "Add a page containing html" do
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelect").select_by(:text, "Fixed HTML")
    $browser.find_element(:id, "fixedHTMLSaveToVar").clear
    $browser.find_element(:id, "fixedHTMLSaveToVar").send_keys("test")
    $browser.find_element(:id, "fixedHTMLValue").clear
    $browser.find_element(:id, "fixedHTMLValue").send_keys("This is a test.")
    $browser.find_element(:xpath, "(.//input[@id='doneWithContent'])[3]").click
    $browser.find_element(:id, "pageName").clear
    $browser.find_element(:id, "pageName").send_keys("Test")
    $browser.find_element(:id, "pageName").clear
    $browser.find_element(:id, "pageName").send_keys("Test HTML")
    $browser.find_element(:id, "pageName").clear
    $browser.find_element(:id, "pageName").send_keys("Test HTML Page")
    $browser.find_element(:name, "prettyUrl").clear
    $browser.find_element(:name, "prettyUrl").send_keys("/html")
    $browser.find_element(:id, "menuCheckbox").click
    $browser.find_element(:id, "menuLinkText").clear
    $browser.find_element(:id, "menuLinkText").send_keys("Test HTML Page")
    $browser.find_element(:id, "pageSave").click
    expect($browser.title).to eq("Pages")
  end

  it "Verify HTML page correct" do
    $browser.find_element(:link_text, "Test HTML Page")
    expect(browser_page_text).to include("/html")
    $browser.find_element(:link_text, "Test HTML Page").click
    expect($browser.title).to eq("Test HTML Page")
    expect(browser_page_text).to include("This is a test.")
  end

  it "Veirfy url works" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.navigate.to vivo_url("/html/")
    expect($browser.title).to eq("Test HTML Page")
    expect(browser_page_text).to include("This is a test.")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Log in")
    end
  end
