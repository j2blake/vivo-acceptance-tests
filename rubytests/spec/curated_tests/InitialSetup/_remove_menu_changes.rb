shared_examples "Initial Setup: Remove Menu Changes" do
  it "Remove Menu Management Changes" do
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

  it "Verify new tabs there" do
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Research")
    expect(browser_page_text).to include("Events")
    expect(browser_page_text).to include("Activities")
    expect(browser_page_text).to include("Courses")
    expect(browser_page_text).to include("Equipment")
    expect(browser_page_text).to include("Locations")
    expect(browser_page_text).to include("Test HTML Page")
  end

  it "Delete new menu items one at a time, after going back to Page Management" do
    $browser.find_element(:css, "a[pagetitle=\" Activities\"] img").click
    expect($browser.switch_to.alert.text).to eq("Are you sure you wish to delete this page:  Activities?")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("Pages")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Page management").click
    expect($browser.title).to eq("Pages")
    $browser.find_element(:css, "a[pagetitle=\" Courses\"] img").click
    expect($browser.switch_to.alert.text).to eq("Are you sure you wish to delete this page:  Courses?")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("Pages")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Page management").click
    expect($browser.title).to eq("Pages")
    $browser.find_element(:css, "a[pagetitle=\" Equipment\"] img").click
    expect($browser.switch_to.alert.text).to eq("Are you sure you wish to delete this page:  Equipment?")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("Pages")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Page management").click
    expect($browser.title).to eq("Pages")
    $browser.find_element(:css, "a[pagetitle=\" Locations\"] img").click
    expect($browser.switch_to.alert.text).to eq("Are you sure you wish to delete this page:  Locations?")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("Pages")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Page management").click
    expect($browser.title).to eq("Pages")
    $browser.find_element(:css, "a[pagetitle=\" Test HTML Page\"] img").click
    expect($browser.switch_to.alert.text).to eq("Are you sure you wish to delete this page:  Test HTML Page?")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("Pages")
  end

  it "Verify new tabs gone" do
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Research")
    expect(browser_page_text).to include("Events")
    expect(browser_page_text).not_to include("Activities")
    expect(browser_page_text).not_to include("Courses")
    expect(browser_page_text).not_to include("Equipment")
    expect(browser_page_text).not_to include("Locations")
    expect(browser_page_text).not_to include("Test HTML Page")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Log in")
    end
  end
