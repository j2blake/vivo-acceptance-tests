shared_examples "Search Text Discovery: Delete Stuff" do
  it "Delete everything created" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
  end

  it "Navigate to edit via Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify what's there" do
    expect($browser.find_element(:css, "h2").text).to eq("people")
    $browser.find_element(:link_text, "Person")
    expect(browser_page_text).to include("organizations")
    $browser.find_element(:link_text, "Department")
    $browser.find_element(:link_text, "Organization")
    expect(browser_page_text).to include("research")
    $browser.find_element(:link_text, "Academic Article")
    $browser.find_element(:link_text, "Article")
    expect(browser_page_text).to include("locations")
    $browser.find_element(:link_text, "Continent")
  end

  it "Delete everthing" do
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    $browser.find_element(:link_text, "Baker, Able").click
    expect($browser.title).to eq("Baker, Able")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Department").click
    expect($browser.title).to eq("Department")
    $browser.find_element(:link_text, "Advanced Puttering").click
    expect($browser.title).to eq("Advanced Puttering")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Academic Article").click
    expect($browser.title).to eq("Academic Article")
    $browser.find_element(:link_text, "Musings").click
    expect($browser.title).to eq("Musings")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Continent").click
    expect($browser.title).to eq("Continent")
    $browser.find_element(:link_text, "Lemuria").click
    expect($browser.title).to eq("Lemuria")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
    vivo_wait_for_indexing
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Verify everything is gone" do
    expect($browser.find_elements(:link_text, "Person").size).to eq(0)
    expect($browser.find_elements(:link_text, "Department").size).to eq(0)
    expect($browser.find_elements(:link_text, "Organization").size).to eq(0)
    expect($browser.find_elements(:link_text, "Academic Article").size).to eq(0)
    expect($browser.find_elements(:link_text, "Article").size).to eq(0)
    $browser.find_element(:link_text, "Continent")
    expect($browser.find_element(:xpath, ".//h2[text()='locations']/../ul/li[1]").text).to eq("Continent (7)")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
