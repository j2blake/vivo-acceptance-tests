shared_examples "Create Classes: Add Class Group Times" do
  it "Add class group called Times" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Select Class groups from Site Admin page" do
    $browser.find_element(:link_text, "Class groups").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify Times class group does not already exist" do
    expect(browser_page_text).not_to include("Times")
    $browser.find_element(:id, "addGroup").click
    expect($browser.title).to eq("Classgroup Editing Form")
  end

  it "Add Times class group" do
    $browser.find_element(:name, "PublicName").clear
    $browser.find_element(:name, "PublicName").send_keys("Times")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify Times class group was created properly" do
    expect(browser_page_text).to include("Times")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
