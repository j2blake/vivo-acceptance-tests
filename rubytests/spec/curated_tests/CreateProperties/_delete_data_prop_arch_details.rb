shared_examples "Create Properties: Delete Data Prop Arch Details" do
  it "Delete Data Property architectural details" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Data property hierarchy" do
    $browser.find_element(:link_text, "Data property hierarchy").click
    expect($browser.title).to eq("VIVO")
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "architectural details (vivo)")
  end

  it "Edit architectural details" do
    $browser.find_element(:link_text, "architectural details (vivo)").click
    expect($browser.title).to eq("Data Property Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit this Data Property']").click
    expect($browser.title).to eq("Data Property Editing Form")
  end

  it "Delete architectural details" do
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this record? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO")
    expect($browser.find_elements(:link_text, "architectural details (vivo)").size).to eq(0)
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
