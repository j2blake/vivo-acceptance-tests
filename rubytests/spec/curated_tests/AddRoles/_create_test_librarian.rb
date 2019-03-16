shared_examples "Add Roles: Create Test Librarian" do
  it "Add test Librarian named Lily Librarian" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    expect(browser_page_text).to include("Data Input")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Librarian (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
  end

  it "Add Lily Librarian" do
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Lily")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Librarian")
    vivo_click_and_wait_for_indexing(:id, "submit")
  end

  it "Edit Lily Librarian to add title" do
    expect($browser.title).to eq("Librarian, Lily")
    $browser.find_element(:css, "[title=\"Add new preferred title entry\"]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "preferredTitle").clear
    $browser.find_element(:id, "preferredTitle").send_keys("Associate Librarian")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Verify that account was created" do
    expect(browser_page_text).to include("Librarian, Lily")
    expect(browser_page_text).to include("Associate Librarian")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
