shared_examples "Self Editing: Add Self Editor Id" do
  it "Add email to self-editor field" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Find Jane Faculty via Index" do
    $browser.find_element(:link_text, "Index").click
    expect(browser_page_text).to include("Faculty Member")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add self-editor link field" do
    $browser.find_element(:css, "a.add-ARG_2000028 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "emailAddress").clear
    $browser.find_element(:id, "emailAddress").send_keys("JaneFaculty@mydomain.edu")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
    expect(browser_page_text).to include("JaneFaculty@mydomain.edu")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
