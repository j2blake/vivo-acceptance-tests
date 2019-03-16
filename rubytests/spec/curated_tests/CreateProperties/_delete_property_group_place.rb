shared_examples "Create Properties: Delete Property Group Place" do
  it "Delete test Property Group Place" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Propery Groups" do
    $browser.find_element(:link_text, "Property groups").click
    expect($browser.title).to eq("VIVO")
  end

  it "Make sure Place exists already" do
    $browser.find_element(:link_text, "Place")
  end

  it "Navigate to Place" do
    $browser.find_element(:link_text, "Place").click
    expect($browser.title).to eq("Property Group Editing Form")
  end

  it "Delete Place" do
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this record? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO")
  end

  it "Verify that Place is gone" do
    expect($browser.find_elements(:link_text, "Place").size).to eq(0)
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
