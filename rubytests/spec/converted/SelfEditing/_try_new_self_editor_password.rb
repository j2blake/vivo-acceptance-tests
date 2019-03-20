shared_examples "Self Editing: Try New Self Editor Password" do
  it "Try the reset password for user" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Log in with new password" do
    $browser.find_element(:link_text, "Log in").click
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("JaneFaculty@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("Password")
    $browser.find_element(:name, "loginForm").click
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Overview")
  end

  it "Confirm that it worked" do
    expect(browser_page_text).to include("Jane")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect(browser_page_text).to include("Log out")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
