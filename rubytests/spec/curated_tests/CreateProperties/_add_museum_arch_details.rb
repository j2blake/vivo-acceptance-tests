shared_examples "Create Properties: Add Museum Arch Details" do
  it "Add architectural details to the Johnson Art Museum" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Johnson Art Museum via Index" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Museum")
    $browser.find_element(:link_text, "Organization")
    $browser.find_element(:link_text, "Museum").click
    expect($browser.title).to eq("Museum")
    $browser.find_element(:link_text, "Johnson Art Museum").click
    expect($browser.title).to eq("Johnson Art Museum")
  end

  it "Verify architectural details is an available field" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[16]").click
    expect(browser_page_text).to include("architectural details")
  end

  it "Edit architectural details" do
    $browser.find_element(:xpath, ".//h3[@id='architecturalDetails']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("This is an ugly building!")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Johnson Art Museum")
  end

  it "Verify architectural details" do
    expect(browser_page_text).to include("This is an ugly building!")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
