shared_examples "Create Accounts: First Time Self Editor Login" do
  it "Check first time login process" do
  end

  it "Must not be logged in already" do
  end

  it "Try logging in with wrong password" do
    vivo_login_from_home_page_as("Rick Rookie", "incorrect")
    expect($browser.title).to eq("Log in - VIVO")
    expect(browser_page_text).to include("The email or password you entered is incorrect.")
  end

  it "Login with correct password" do
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("RickRookie@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("myPassword")
    $browser.find_element(:name, "loginForm").click
    expect($browser.title).to eq("Log in - VIVO")
  end

  it "Now it's time to change the password" do
    expect(browser_page_text).to include("New Password")
    expect(browser_page_text).to include("Confirm Password")
  end

  it "Try an invalid password" do
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("junky")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("junky")
    $browser.find_element(:name, "passwordChangeForm").click
    expect(browser_page_text).to include("Please enter a password between 6 and 12 characters in length.")
  end

  it "Try using the original password as the new one" do
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("myPassword")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("myPassword")
    $browser.find_element(:name, "passwordChangeForm").click
    expect($browser.title).to eq("Log in - VIVO")
    expect(browser_page_text).to include("Your new password cannot match the current one.")
  end

  it "Try using 2 different passwords" do
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("newPassword")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("newPasword")
    $browser.find_element(:name, "passwordChangeForm").click
    expect(browser_page_text).to include("The passwords entered do not match.")
  end

  it "Change password correctly" do
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("newPassword")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("newPassword")
    $browser.find_element(:name, "passwordChangeForm").click
  end

  it "Verify that account is logged in" do
    expect(browser_page_text).to include("Rick")
    expect(browser_page_text).to include("You have logged in, but the system contains no profile for you.")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect($browser.find_elements(:link_text, "My profile").size).to eq(0)
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
