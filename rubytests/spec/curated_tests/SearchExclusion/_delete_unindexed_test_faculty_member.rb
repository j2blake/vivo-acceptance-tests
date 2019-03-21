shared_examples "Search Exclusion: Delete UnIndexed Test Faculty Member" do
  it "Delete test person Jane Faculty" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Jane Faculty via the back pages" do
    $browser.navigate.to vivo_url("/vclassEdit?uri=http%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2FPerson")
    expect($browser.title).to eq("Class Control Panel")
    $browser.find_element(:xpath, "//input[@value='Show All Individuals in This Class']").click
    expect($browser.title).to eq("Individuals in Class Person")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Delete Jane Faculty" do
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
