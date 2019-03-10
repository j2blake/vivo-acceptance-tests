shared_examples "Create Classes: Delete Sub Class Minutes" do
  it "Delete test sub-class Minutes" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Class hierarchy" do
    $browser.find_element(:link_text, "Class hierarchy").click
    expect($browser.title).to eq("VIVO")
  end

  it "Make sure sub-class Minutes actually exists" do
    $browser.find_element(:link_text, "Minutes")
  end

  it "Select to edit sub-class Minutes" do
    $browser.find_element(:link_text, "Minutes").click
    expect($browser.title).to eq("Class Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit Class']").click
    expect($browser.title).to eq("Class Editing Form")
  end

  it "Delete sub-class Hours" do
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this record? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO")
  end

  it "Verify sub-class Minutes no longer exists" do
    expect($browser.find_elements(:link_text, "Minutes").size).to eq(0)
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
