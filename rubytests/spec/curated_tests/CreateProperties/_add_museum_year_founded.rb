shared_examples "Create Properties: Add Museum Year Founded" do
  it "Associate year founded with the Johnson Art Museum" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate Johnson Art Museum via Index" do
    vivo_wait_for_indexing
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Museum").click
    expect($browser.title).to eq("Museum")
    $browser.find_element(:link_text, "Johnson Art Museum").click
    expect($browser.title).to eq("Johnson Art Museum")
  end

  it "Set hours to 10am-4pm" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[16]").click
    $browser.find_element(:css, "a.add-yearFounded > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1959")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Johnson Art Museum")
  end

  it "Verify year founded has been set" do
    expect(browser_page_text).to include("1959 -")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
