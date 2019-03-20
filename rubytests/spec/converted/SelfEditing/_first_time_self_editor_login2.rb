shared_examples "Self Editing: First Time Self Editor Login2" do
  it "Check first time login process" do
  end

  it "Must not be logged in already" do
  end

  it "Try logging in with wrong password" do
    vivo_login_from_home_page_as("JaneFaculty@mydomain.edu", "myPassword")
    expect($browser.title).to eq("Log in - VIVO")
    expect(browser_page_text).to include("Change Password to Log in")
  end

  it "Now it's time to change the password" do
    expect(browser_page_text).to include("New Password")
    expect(browser_page_text).to include("Confirm Password")
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("Password")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("Password")
    $browser.find_element(:name, "passwordChangeForm").click
  end

  it "Verify that account is logged in" do
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Jane")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
