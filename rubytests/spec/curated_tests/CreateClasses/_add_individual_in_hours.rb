shared_examples "Create Classes: Add Individual In Hours" do
  it "Add Individual Daytime hours to Hours class" do
  end

  it "Must not be logged in already" do
  end

  it "Log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Class hierarchy" do
    $browser.find_element(:link_text, "Class hierarchy").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify the Hours class exists" do
    $browser.find_element(:link_text, "Hours")
  end

  it "Link to Class Hours" do
    $browser.find_element(:link_text, "Hours").click
    expect($browser.title).to eq("Class Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Show All Individuals in This Class']").click
    expect($browser.title).to eq("Individuals in Class Hours")
    expect(browser_page_text).to include("No individuals to display")
  end

  it "Verify Daytime hours does not exist" do
    expect(browser_page_text).not_to include("Daytime hours")
    $browser.find_element(:xpath, ".//input[@value='Add instance']").click
    expect($browser.title).to eq("Individual Editing Form")
  end

  it "Add Individual Class hours" do
    $browser.find_element(:name, "Name").clear
    $browser.find_element(:name, "Name").send_keys("Daytime hours")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Verify that Day hours has been added" do
    expect(browser_page_text).to include("Daytime hours")
    $browser.find_element(:link_text, "Hours")
    $browser.find_element(:link_text, "Hours").click
    expect($browser.title).to eq("Class Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Show All Individuals in This Class']").click
    expect($browser.title).to eq("Individuals in Class Hours")
    $browser.find_element(:link_text, "Daytime hours")
    $browser.find_element(:link_text, "Hours")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
