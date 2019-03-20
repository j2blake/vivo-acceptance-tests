shared_examples "Self Editing: Check Self Editor Privileges" do
  it "Check self-editor user rights" do
  end

  it "Must not be logged in already" do
  end

  it "Login as Jane Faculty" do
    vivo_login_from_home_page_as("JaneFaculty@mydomain.edu", "Password")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Check privileges" do
    expect(browser_page_text).not_to include("Site Admin")
    expect($browser.find_elements(:link_text, "Site Admin").size).to eq(0)
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
    $browser.find_element(:css, "a.add-overview > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("I am updating my own profile.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("I am updating my own profile.")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
