shared_examples "Create Properties: Change Place Display Rank" do
  it "Change the display rank of the Place property" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Property groups" do
    $browser.find_element(:link_text, "Property groups").click
    expect($browser.title).to eq("VIVO")
  end

  it "Naviagate to Place" do
    $browser.find_element(:link_text, "Place").click
    expect($browser.title).to eq("Property Group Editing Form")
  end

  it "Change Display Rank for place from 5 to 2" do
    $browser.find_element(:name, "DisplayRank").clear
    $browser.find_element(:name, "DisplayRank").send_keys("2")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify change has taken place" do
    $browser.find_element(:link_text, "Place")
    expect(browser_page_text).to include("Display Rank:")
    expect(browser_page_text).to include("2")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
