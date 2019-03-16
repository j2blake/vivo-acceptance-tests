shared_examples "Create Properties: Add Property Group Place" do
  it "Add Property Group Place" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Property Groups" do
    $browser.find_element(:link_text, "Property groups").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify Property Group Place does not exist already" do
    expect($browser.find_elements(:link_text, "Place").size).to eq(0)
    $browser.find_element(:xpath, ".//input[@value='Add new property group']").click
    expect($browser.title).to eq("Property Group Editing Form")
  end

  it "Add Property Group Place" do
    $browser.find_element(:name, "Name").clear
    $browser.find_element(:name, "Name").send_keys("Place")
    $browser.find_element(:name, "PublicDescription").clear
    $browser.find_element(:name, "PublicDescription").send_keys("Properties related to location (building or non-geographic)")
    $browser.find_element(:name, "DisplayRank").clear
    $browser.find_element(:name, "DisplayRank").send_keys("5")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify Property Group Place " do
    expect(browser_page_text).to include("Place")
    $browser.find_element(:link_text, "Place")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
