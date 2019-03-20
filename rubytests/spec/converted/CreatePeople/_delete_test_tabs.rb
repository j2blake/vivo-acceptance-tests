shared_examples "Create People: Delete Test Tabs" do
  it "Delete test Tabs--not a test because this is tested in another suite" do
  end

  it "Must not be logged in" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Tab Management" do
    $browser.find_element(:link_text, "Tab management").click
    expect($browser.title).to eq("Tabs")
    $browser.find_element(:link_text, "Faculty").click
    expect($browser.title).to eq("Tab Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit Tab Details']").click
    expect($browser.title).to eq("Tab Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this record? If in doubt, CANCEL.")
    expect($browser.title).to eq("Tabs")
    $browser.find_element(:link_text, "Librarians").click
    expect($browser.title).to eq("Tab Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit Tab Details']").click
    expect($browser.title).to eq("Tab Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this record? If in doubt, CANCEL.")
    expect($browser.title).to eq("Tabs")
    $browser.find_element(:link_text, "Academic Staff").click
    expect($browser.title).to eq("Tab Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit Tab Details']").click
    expect($browser.title).to eq("Tab Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this record? If in doubt, CANCEL.")
    expect($browser.title).to eq("Tabs")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
