shared_examples "Create Properties: Add Museum" do
  it "Create a test museum" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Add new Individual of Museum" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Museum (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
  end

  it "Add Johnson Art Museum" do
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Johnson Art Museum")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Johnson Art Museum")
  end

  it "Verify Johnson Art Museum was added" do
    expect(browser_page_text).to include("Johnson Art Museum")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
