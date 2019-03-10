shared_examples "Create Classes: Delete Individual In Hours" do
  it "Delete test Individual Daytime hours" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Class hierarchy" do
    $browser.find_element(:link_text, "Class hierarchy").click
    expect($browser.title).to eq("VIVO")
  end

  it "Select Class Hours" do
    $browser.find_element(:link_text, "Hours").click
    expect($browser.title).to eq("Class Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Show All Individuals in This Class']").click
    expect($browser.title).to eq("Individuals in Class Hours")
  end

  it "Verify Daytime hours exists" do
    $browser.find_element(:link_text, "Daytime hours")
  end

  it "Navigate to Daytime hours" do
    $browser.find_element(:link_text, "Daytime hours").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Delete Daytime hours" do
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Verify that Daytime hours is gone" do
    $browser.find_element(:link_text, "Class hierarchy").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "Hours").click
    expect($browser.title).to eq("Class Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Show All Individuals in This Class']").click
    expect($browser.title).to eq("Individuals in Class Hours")
    expect(browser_page_text).to include("No individuals to display")
    expect(browser_page_text).not_to include("Daytime hours")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
