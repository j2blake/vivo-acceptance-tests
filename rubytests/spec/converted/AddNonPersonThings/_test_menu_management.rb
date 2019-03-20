shared_examples "Add Non Person Things: Test Menu Management" do
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
    $browser.find_element(:link_text, "Page management").click
    expect($browser.title).to eq("Pages")
  end

  it "Add Activities menu" do
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "pageName").clear
    $browser.find_element(:id, "pageName").send_keys("Activities")
    $browser.find_element(:name, "prettyUrl").clear
    $browser.find_element(:name, "prettyUrl").send_keys("/activities")
    browser_find_select_list(:id, "typeSelect").select_by(:text, "Browse Class Group")
    browser_find_select_list(:id, "selectClassGroup").select_by(:text, "activities")
    $browser.find_element(:css, "option[value=\"http://vivoweb.org/ontology#vitroClassGroupactivities\"]").click
    $browser.find_element(:id, "doneWithContent").click
    $browser.find_element(:id, "menuCheckbox").click
    $browser.find_element(:id, "pageSave").click
    expect($browser.title).to eq("Pages")
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Research")
    expect(browser_page_text).to include("Events")
    expect(browser_page_text).to include("Activities")
  end

  it "Add Courses menu" do
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "pageName").clear
    $browser.find_element(:id, "pageName").send_keys("Courses")
    $browser.find_element(:name, "prettyUrl").clear
    $browser.find_element(:name, "prettyUrl").send_keys("/courses")
    browser_find_select_list(:id, "typeSelect").select_by(:text, "Browse Class Group")
    browser_find_select_list(:id, "selectClassGroup").select_by(:text, "courses")
    $browser.find_element(:css, "option[value=\"http://vivoweb.org/ontology#vitroClassGroupactivities\"]").click
    $browser.find_element(:id, "doneWithContent").click
    $browser.find_element(:id, "menuCheckbox").click
    $browser.find_element(:id, "pageSave").click
    expect($browser.title).to eq("Pages")
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Research")
    expect(browser_page_text).to include("Events")
    expect(browser_page_text).to include("Activities")
    expect(browser_page_text).to include("Courses")
  end

  it "Add Equipment menu" do
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "pageName").clear
    $browser.find_element(:id, "pageName").send_keys("Equipment")
    $browser.find_element(:name, "prettyUrl").clear
    $browser.find_element(:name, "prettyUrl").send_keys("/equipment")
    browser_find_select_list(:id, "typeSelect").select_by(:text, "Browse Class Group")
    browser_find_select_list(:id, "selectClassGroup").select_by(:text, "equipment")
    $browser.find_element(:css, "option[value=\"http://vivoweb.org/ontology#vitroClassGroupactivities\"]").click
    $browser.find_element(:id, "doneWithContent").click
    $browser.find_element(:id, "menuCheckbox").click
    $browser.find_element(:id, "pageSave").click
    expect($browser.title).to eq("Pages")
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Research")
    expect(browser_page_text).to include("Events")
    expect(browser_page_text).to include("Activities")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Research")
    expect(browser_page_text).to include("Events")
    expect(browser_page_text).to include("Activities")
    expect(browser_page_text).to include("Courses")
    expect(browser_page_text).to include("Equipment")
  end

  it "Add Locations menu" do
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "pageName").clear
    $browser.find_element(:id, "pageName").send_keys("Locations")
    $browser.find_element(:name, "prettyUrl").clear
    $browser.find_element(:name, "prettyUrl").send_keys("/locations")
    browser_find_select_list(:id, "typeSelect").select_by(:text, "Browse Class Group")
    browser_find_select_list(:id, "selectClassGroup").select_by(:text, "locations")
    $browser.find_element(:css, "option[value=\"http://vivoweb.org/ontology#vitroClassGroupactivities\"]").click
    $browser.find_element(:id, "doneWithContent").click
    $browser.find_element(:id, "menuCheckbox").click
    $browser.find_element(:id, "pageSave").click
    expect($browser.title).to eq("Pages")
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Research")
    expect(browser_page_text).to include("Events")
    expect(browser_page_text).to include("Activities")
    expect(browser_page_text).to include("Locations")
  end

  it "Check Activities menu tab" do
    $browser.find_element(:link_text, "Activities").click
    expect($browser.title).to eq("Activities")
    $browser.find_element(:link_text, "Project (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Human and Ape Brain Comparison")
    $browser.find_element(:link_text, "Research Project (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Human and Ape Brain Comparison")
    $browser.find_element(:link_text, "Service (2)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Gorilla Moving Company")
    $browser.find_element(:link_text, "Primate Heart Health")
    $browser.find_element(:link_text, "Transport Service (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Gorilla Moving Company")
  end

  it "Check Courses menu tab" do
    $browser.find_element(:link_text, "Courses").click
    expect($browser.title).to eq("Courses")
    $browser.find_element(:link_text, "Course (2)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Course")
    $browser.find_element(:link_text, "Introduction to Primates")
    $browser.find_element(:link_text, "Introduction to Primate Health")
  end

  it "Check Equipment menu tab" do
    $browser.find_element(:link_text, "Equipment").click
    expect($browser.title).to eq("Equipment")
    $browser.find_element(:link_text, "Equipment (2)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Equipment")
    $browser.find_element(:link_text, "Portable Primate Habitat")
    $browser.find_element(:link_text, "Primate Feeder")
  end

  it "Check Locations menu" do
    $browser.find_element(:link_text, "Locations").click
    expect($browser.title).to eq("Locations")
    $browser.find_element(:link_text, "Building (2)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Building")
    $browser.find_element(:link_text, "Jane Memorial Building")
    $browser.find_element(:link_text, "Primate Memorial Building")
    $browser.find_element(:link_text, "Facility (5)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Jane Memorial Building")
    $browser.find_element(:link_text, "Lab Admin Office")
    $browser.find_element(:link_text, "Primate Memorial Building")
    $browser.find_element(:link_text, "Primate Research Lab Room 123")
    $browser.find_element(:link_text, "State Fair Park")
    $browser.find_element(:link_text, "Room (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Lab Admin Office")
  end

  it "Delete new menus" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Page management").click
    expect($browser.title).to eq("Pages")
    $browser.find_element(:xpath, "(.//img[@alt='delete this page'])[2]").click
    browser_accept_alert("Are you sure you wish to delete this page:  Activities?")
    expect($browser.title).to eq("Pages")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Page management").click
    expect($browser.title).to eq("Pages")
    $browser.find_element(:xpath, "(.//img[@alt='delete this page'])[4]").click
    browser_accept_alert("Are you sure you wish to delete this page:  Courses?")
    expect($browser.title).to eq("Pages")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Page management").click
    expect($browser.title).to eq("Pages")
    $browser.find_element(:xpath, "(.//img[@alt='delete this page'])[6]").click
    browser_accept_alert("Are you sure you wish to delete this page:  Equipment?")
    expect($browser.title).to eq("Pages")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Page management").click
    expect($browser.title).to eq("Pages")
    $browser.find_element(:xpath, "(.//img[@alt='delete this page'])[7]").click
    browser_accept_alert("Are you sure you wish to delete this page:  Locations?")
    expect($browser.title).to eq("Pages")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Page management").click
    expect($browser.title).to eq("Pages")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Log in")
    end
  end
