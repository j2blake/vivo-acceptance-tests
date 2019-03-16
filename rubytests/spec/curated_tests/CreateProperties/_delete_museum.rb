shared_examples "Create Properties: Delete Museum" do
  it "Deete Johnson Art Museum" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
  end

  it "Navigate to edit via Index" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Museum").click
    expect($browser.title).to eq("Museum")
    $browser.find_element(:link_text, "Johnson Art Museum").click
    expect($browser.title).to eq("Johnson Art Museum")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Delete Johnson Art Museum" do
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    vivo_wait_for_indexing
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify Museum link is gone" do
    expect(browser_page_text).not_to include("Museum")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
