shared_examples "Proxy Editing: Create New Librarian" do
  it "Create Librarian person" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to add new individual page" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Librarian (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect(browser_page_text).to include("Create a new Librarian")
  end

  it "Create a librarian individual" do
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Lily")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Librarian")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
