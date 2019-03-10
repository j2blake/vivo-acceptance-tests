shared_examples "Create Classes: Delete Class Group Times" do
  it "Delete test class group Times" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Class groups" do
    $browser.find_element(:link_text, "Class groups").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify Times class does exist" do
    $browser.find_element(:link_text, "Times")
  end

  it "Select to edit Times class" do
    $browser.find_element(:link_text, "Times").click
    expect($browser.title).to eq("Classgroup Editing Form")
  end

  it "Delete Times class" do
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this record? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO")
  end

  it "Verify Times class no longer exists" do
    expect($browser.find_elements(:link_text, "Times").size).to eq(0)
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
