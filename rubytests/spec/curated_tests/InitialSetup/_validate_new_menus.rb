shared_examples "Initial Setup: Validate New Menus" do
  it "Test Menu Management" do
  end

  it "Must be logged out" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Menu Management" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Menu ordering").click
    expect($browser.title).to eq("Default Menu")
  end

  it "Validate adding menu item with Activities" do
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add New Page")
    expect(browser_page_text).to include("Title *")
    expect(browser_page_text).to include("Content Type *")
    expect(browser_page_text).to include("Add one or more types")
    expect(browser_page_text).to include("Pretty URL *")
    expect(browser_page_text).to include("Must begin with a leading forward slash")
    expect(browser_page_text).to include("Template")
    expect(browser_page_text).to include("Default")
    expect(browser_page_text).to include("Custom template requiring content")
    expect(browser_page_text).to include("Custom template containing all content")
    expect(browser_page_text).to include("This is a menu page")
    expect(browser_page_text).to include("Menu Item Name")
    expect(browser_page_text).to include("If left blank, the page title will be used.")
    expect(browser_page_text).to include("Select page permissions")
    $browser.find_element(:link_text, "Cancel")
    $browser.find_element(:id, "cancelPage").click
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Menu ordering").click
    expect($browser.title).to eq("Default Menu")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:name, "pageName").clear
    $browser.find_element(:name, "pageName").send_keys("Activities")
    browser_find_select_list(:id, "typeSelect").select_by(:text, "Browse Class Group")
    browser_find_select_list(:id, "selectClassGroup").select_by(:text, "activities")
    $browser.find_element(:css, "option[value=\"http://vivoweb.org/ontology#vitroClassGroupactivities\"]").click
    $browser.find_element(:id, "doneWithContent").click
    $browser.find_element(:name, "prettyUrl").clear
    $browser.find_element(:name, "prettyUrl").send_keys("/activities")
    $browser.find_element(:id, "menuCheckbox").click
    $browser.find_element(:id, "menuCheckbox").click
    $browser.find_element(:id, "pageSave").click
    expect($browser.title).to eq("Pages")
    expect(browser_page_text).to include("Activities")
    $browser.find_element(:link_text, "Activities")
    expect(browser_page_text).to include("/activities")
    expect(browser_page_text).to include("Events")
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Pages")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Research")
  end

  it "Add Courses menu" do
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:name, "pageName").clear
    $browser.find_element(:name, "pageName").send_keys("Courses")
    browser_find_select_list(:id, "typeSelect").select_by(:text, "Browse Class Group")
    browser_find_select_list(:id, "selectClassGroup").select_by(:text, "courses")
    $browser.find_element(:id, "doneWithContent").click
    $browser.find_element(:name, "prettyUrl").clear
    $browser.find_element(:name, "prettyUrl").send_keys("/courses")
    $browser.find_element(:id, "menuCheckbox").click
    $browser.find_element(:id, "pageSave").click
    expect($browser.title).to eq("Pages")
    expect(browser_page_text).to include("Activities")
    $browser.find_element(:link_text, "Activities")
    expect(browser_page_text).to include("/activities")
    expect(browser_page_text).to include("Courses")
    $browser.find_element(:link_text, "Courses")
    expect(browser_page_text).to include("/courses")
    expect(browser_page_text).to include("Events")
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Pages")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Research")
  end

  it "Add Equipment menu" do
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:name, "pageName").clear
    $browser.find_element(:name, "pageName").send_keys("Equipment")
    browser_find_select_list(:id, "typeSelect").select_by(:text, "Browse Class Group")
    browser_find_select_list(:id, "selectClassGroup").select_by(:text, "equipment")
    $browser.find_element(:css, "option[value=\"http://vivoweb.org/ontology#vitroClassGroupequipment\"]").click
    $browser.find_element(:id, "doneWithContent").click
    $browser.find_element(:name, "prettyUrl").clear
    $browser.find_element(:name, "prettyUrl").send_keys("/equipment")
    $browser.find_element(:id, "menuCheckbox").click
    $browser.find_element(:id, "pageSave").click
    expect($browser.title).to eq("Pages")
    expect(browser_page_text).to include("Activities")
    $browser.find_element(:link_text, "Activities")
    expect(browser_page_text).to include("/activities")
    expect(browser_page_text).to include("Courses")
    $browser.find_element(:link_text, "Courses")
    expect(browser_page_text).to include("/courses")
    expect(browser_page_text).to include("Equipment")
    $browser.find_element(:link_text, "Equipment")
    expect(browser_page_text).to include("/equipment")
    expect(browser_page_text).to include("Events")
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Pages")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Research")
  end

  it "Add Locations menu" do
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:name, "pageName").clear
    $browser.find_element(:name, "pageName").send_keys("Locations")
    browser_find_select_list(:id, "typeSelect").select_by(:text, "Browse Class Group")
    browser_find_select_list(:id, "selectClassGroup").select_by(:text, "locations")
    $browser.find_element(:css, "option[value=\"http://vivoweb.org/ontology#vitroClassGrouplocations\"]").click
    $browser.find_element(:id, "doneWithContent").click
    $browser.find_element(:name, "prettyUrl").clear
    $browser.find_element(:name, "prettyUrl").send_keys("/locations")
    $browser.find_element(:id, "menuCheckbox").click
    $browser.find_element(:id, "pageSave").click
    expect($browser.title).to eq("Pages")
    expect(browser_page_text).to include("Activities")
    $browser.find_element(:link_text, "Activities")
    expect(browser_page_text).to include("/activities")
    expect(browser_page_text).to include("Courses")
    $browser.find_element(:link_text, "Courses")
    expect(browser_page_text).to include("/courses")
    expect(browser_page_text).to include("Equipment")
    $browser.find_element(:link_text, "Equipment")
    expect(browser_page_text).to include("/equipment")
    expect(browser_page_text).to include("Events")
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("Locations")
    $browser.find_element(:link_text, "Locations")
    expect(browser_page_text).to include("/locations")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Pages")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Research")
  end

  it "Check Activities menu tab" do
    $browser.find_element(:link_text, "Activities").click
    expect($browser.title).to eq("Activities")
    browser_wait_for_jQuery
    expect(browser_page_text).to include("There is currently no Activities content in the system")
    expect(browser_page_text).to include("You can add content and manage this site from the Site Administration page.")
    $browser.find_element(:link_text, "add content and manage this site")
    expect(browser_page_text).to include("You can browse all of the public content currently in the system using the index page.")
    $browser.find_element(:link_text, "index page")
    expect(browser_page_text).to include("Expecting content?")
    expect(browser_page_text).to include("Try rebuilding the search index.")
    $browser.find_element(:link_text, "Try rebuilding the search index")
  end

  it "Check Courses menu tab" do
    $browser.find_element(:link_text, "Courses").click
    expect($browser.title).to eq("Courses")
    browser_wait_for_jQuery
    expect(browser_page_text).to include("There is currently no Courses content in the system")
    expect(browser_page_text).to include("You can add content and manage this site from the Site Administration page.")
    $browser.find_element(:link_text, "add content and manage this site")
    expect(browser_page_text).to include("You can browse all of the public content currently in the system using the index page.")
    $browser.find_element(:link_text, "index page")
    expect(browser_page_text).to include("Expecting content?")
    expect(browser_page_text).to include("Try rebuilding the search index.")
    $browser.find_element(:link_text, "Try rebuilding the search index")
  end

  it "Check Equipment menu tab" do
    $browser.find_element(:link_text, "Equipment").click
    expect($browser.title).to eq("Equipment")
    browser_wait_for_jQuery
    expect(browser_page_text).to include("There is currently no Equipment content in the system")
    expect(browser_page_text).to include("You can add content and manage this site from the Site Administration page.")
    $browser.find_element(:link_text, "add content and manage this site")
    expect(browser_page_text).to include("You can browse all of the public content currently in the system using the index page.")
    $browser.find_element(:link_text, "index page")
    expect(browser_page_text).to include("Expecting content?")
    expect(browser_page_text).to include("Try rebuilding the search index.")
    $browser.find_element(:link_text, "Try rebuilding the search index")
  end

  it "Check Locations menu" do
    $browser.find_element(:link_text, "Locations").click
    expect($browser.title).to eq("Locations")
    browser_wait_for_jQuery
    expect(browser_page_text).to include("Locations")
    expect(browser_page_text).to include("Continent")
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    $browser.find_element(:link_text, "Africa")
    $browser.find_element(:link_text, "Antarctica")
    $browser.find_element(:link_text, "Asia")
    $browser.find_element(:link_text, "Australia and New Zealand")
    $browser.find_element(:link_text, "Europe")
    $browser.find_element(:link_text, "North America")
    $browser.find_element(:link_text, "South America")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Log in")
    end
  end
