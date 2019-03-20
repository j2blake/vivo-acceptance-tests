shared_examples "Self Editing: Create Faculty Member" do
  it "Add a Faculty member named Jane Faculty" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    expect(browser_page_text).to include("Data Input")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
  end

  it "Add Jane Faculty" do
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Jane")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Faculty")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
