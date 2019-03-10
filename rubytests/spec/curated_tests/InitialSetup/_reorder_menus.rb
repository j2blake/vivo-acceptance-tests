shared_examples "Initial Setup: Reorder Menus" do
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

  it "Verify default tabs are in Menu Ordering list" do
    expect(browser_page_text).to include("Menu Ordering")
    expect(browser_page_text).to include("Home")
    expect(browser_page_text).to include("People")
    expect(browser_page_text).to include("Organizations")
    expect(browser_page_text).to include("Research")
    expect(browser_page_text).to include("Events")
    expect($browser.find_element(:id, "submit")["value"]).to eq("Add new menu page")
    expect(browser_page_text).to include("Refresh page after reordering menu items")
  end

  it "Verify default People URL" do
    $browser.navigate.to vivo_url("/people")
    expect($browser.title).to eq("People")
    expect(browser_page_text).to include("There is currently no People content in the system")
    expect(browser_page_text).to include("You can add content and manage this site from the Site Administration page.")
    $browser.find_element(:link_text, "add content and manage this site")
    expect(browser_page_text).to include("You can browse all of the public content currently in the system using the index page.")
    $browser.find_element(:link_text, "index page")
    expect(browser_page_text).to include("Expecting content?")
    expect(browser_page_text).to include("Try rebuilding the search index.")
    $browser.find_element(:link_text, "Try rebuilding the search index")
  end

  it "Verify default Organizations URL" do
    $browser.navigate.to vivo_url("/organizations")
    expect($browser.title).to eq("Organizations")
    expect(browser_page_text).to include("There is currently no Organizations content in the system")
    expect(browser_page_text).to include("You can add content and manage this site from the Site Administration page.")
    $browser.find_element(:link_text, "add content and manage this site")
    expect(browser_page_text).to include("You can browse all of the public content currently in the system using the index page.")
    $browser.find_element(:link_text, "index page")
    expect(browser_page_text).to include("Expecting content?")
    expect(browser_page_text).to include("Try rebuilding the search index.")
    $browser.find_element(:link_text, "Try rebuilding the search index")
  end

  it "Verify default Research URL" do
    $browser.navigate.to vivo_url("/research")
    expect($browser.title).to eq("Research")
    expect(browser_page_text).to include("There is currently no Research content in the system")
    expect(browser_page_text).to include("You can add content and manage this site from the Site Administration page.")
    $browser.find_element(:link_text, "add content and manage this site")
    expect(browser_page_text).to include("You can browse all of the public content currently in the system using the index page.")
    $browser.find_element(:link_text, "index page")
    expect(browser_page_text).to include("Expecting content?")
    expect(browser_page_text).to include("Try rebuilding the search index.")
    $browser.find_element(:link_text, "Try rebuilding the search index")
  end

  it "Verify default Events URL" do
    $browser.navigate.to vivo_url("/events")
    expect($browser.title).to eq("Events")
    expect(browser_page_text).to include("There is currently no Events content in the system")
    expect(browser_page_text).to include("You can add content and manage this site from the Site Administration page.")
    $browser.find_element(:link_text, "add content and manage this site")
    expect(browser_page_text).to include("You can browse all of the public content currently in the system using the index page.")
    $browser.find_element(:link_text, "index page")
    expect(browser_page_text).to include("Expecting content?")
    expect(browser_page_text).to include("Try rebuilding the search index.")
    $browser.find_element(:link_text, "Try rebuilding the search index")
  end

  it "Verify default People tab" do
    $browser.find_element(:link_text, "People").click
    expect($browser.title).to eq("People")
    expect(browser_page_text).to include("There is currently no People content in the system")
    expect(browser_page_text).to include("You can add content and manage this site from the Site Administration page.")
    $browser.find_element(:link_text, "add content and manage this site")
    expect(browser_page_text).to include("You can browse all of the public content currently in the system using the index page.")
    $browser.find_element(:link_text, "index page")
    expect(browser_page_text).to include("Expecting content?")
    expect(browser_page_text).to include("Try rebuilding the search index.")
    $browser.find_element(:link_text, "Try rebuilding the search index")
  end

  it "Verify default Organizations tab" do
    $browser.find_element(:link_text, "Organizations").click
    expect($browser.title).to eq("Organizations")
    expect(browser_page_text).to include("There is currently no Organizations content in the system")
    expect(browser_page_text).to include("You can add content and manage this site from the Site Administration page.")
    $browser.find_element(:link_text, "add content and manage this site")
    expect(browser_page_text).to include("You can browse all of the public content currently in the system using the index page.")
    $browser.find_element(:link_text, "index page")
    expect(browser_page_text).to include("Expecting content?")
    expect(browser_page_text).to include("Try rebuilding the search index.")
    $browser.find_element(:link_text, "Try rebuilding the search index")
  end

  it "Verify default Research tab" do
    $browser.find_element(:link_text, "Research").click
    expect($browser.title).to eq("Research")
    expect(browser_page_text).to include("There is currently no Research content in the system")
    expect(browser_page_text).to include("You can add content and manage this site from the Site Administration page.")
    $browser.find_element(:link_text, "add content and manage this site")
    expect(browser_page_text).to include("You can browse all of the public content currently in the system using the index page.")
    $browser.find_element(:link_text, "index page")
    expect(browser_page_text).to include("Expecting content?")
    expect(browser_page_text).to include("Try rebuilding the search index.")
    $browser.find_element(:link_text, "Try rebuilding the search index")
  end

  it "Verify default Events tab" do
    $browser.find_element(:link_text, "Events").click
    expect($browser.title).to eq("Events")
    expect(browser_page_text).to include("There is currently no Events content in the system")
    expect(browser_page_text).to include("You can add content and manage this site from the Site Administration page.")
    $browser.find_element(:link_text, "add content and manage this site")
    expect(browser_page_text).to include("You can browse all of the public content currently in the system using the index page.")
    $browser.find_element(:link_text, "index page")
    expect(browser_page_text).to include("Expecting content?")
    expect(browser_page_text).to include("Try rebuilding the search index.")
    $browser.find_element(:link_text, "Try rebuilding the search index")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Log in")
    end
  end
