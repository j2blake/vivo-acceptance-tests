shared_examples "Self Editing: Add Self Editor Id2" do
  it "Add email to self-editor field" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Find Jane Faculty via Index" do
    vivo_wait_for_indexing
    $browser.find_element(:link_text, "Index").click
    expect(browser_page_text).to include("Faculty Member")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add self-editor link field" do
    $browser.find_element(:css, "a.add-researcherId > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("JaneFaculty@mydomain.edu")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
    expect(browser_page_text).to include("JaneFaculty@mydomain.edu")
  end

  it "Associate Jane's profile with her user account" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "User accounts").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "JaneFaculty@mydomain.edu").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:id, "associateProfileName").send_keys("Facu")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "submitMyAccount").click
    expect($browser.title).to eq("VIVO")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
