shared_examples "Proxy Editing: Validate User Proxy" do
  it "Validate multiple proxy editors" do
  end

  it "Login as admin" do
    vivo_login_from_home_page_as("JaneFaculty@mydomain.edu", "Password")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify existing relationship" do
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).not_to include("Proxy, Polly |")
    expect(browser_page_text).not_to include("Editor, Eddie |")
  end

  it "Now make Eddie and Connie proxy editors" do
  end

  it "Select Eddie Editor" do
    $browser.find_element(:id, "addProfileEditor").send_keys("edit")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "addProfileEditor").send_keys("prox")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "submitMyAccount").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Your changes have been saved.")
    expect(browser_page_text).to include("Proxy, Polly |")
    $browser.find_element(:link_text, "Remove selection")
    expect(browser_page_text).to include("Editor, Eddie |")
    $browser.find_element(:link_text, "Remove selection")
  end

  it "Test that editing works for Eddie Editor" do
    vivo_logout
    $browser.find_element(:id, "loginName").clear
    $browser.find_element(:id, "loginName").send_keys("EddieEditor@mydomain.edu")
    $browser.find_element(:id, "loginPassword").clear
    $browser.find_element(:id, "loginPassword").send_keys("Password")
    $browser.find_element(:name, "loginForm").click
    expect($browser.title).to eq("VIVO")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect($browser.find_elements(:link_text, "My profile").size).to eq(0)
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Overview")
  end

  it "Test that editing works for Polly Proxy" do
    vivo_logout
    vivo_login_as("PollyProxy@mydomain.edu", "Password")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect($browser.find_elements(:link_text, "My profile").size).to eq(0)
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Overview")
  end

  it "Verify that test admin sees the relationship" do
    vivo_logout
    vivo_login_as("testAdmin@mydomain.edu", "Password")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect($browser.find_elements(:link_text, "My profile").size).to eq(0)
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Manage profile editing").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Editor, Eddie |")
    $browser.find_element(:link_text, "Delete profile editor")
    expect(browser_page_text).to include("Proxy, Polly |")
    $browser.find_element(:link_text, "Delete profile editor")
    expect(browser_page_text).to include("Faculty, Jane | Faculty Member")
    $browser.find_element(:link_text, "Remove selection")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
