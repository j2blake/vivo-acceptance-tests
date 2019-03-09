shared_examples "Admin Security: New Admin First Login" do
  it "Login for first time with new admin account" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Must not be logged in already" do
    $browser.find_element(:link_text, "Log in").click
    expect($browser.title).to eq("Log in - VIVO")
    expect(browser_page_text).to include("Log in")
  end

  it "Try logging in without a password" do
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("SisAdmin@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("")
    $browser.find_element(:name, "loginForm").click
    expect(browser_page_text).to include("Email")
    expect(browser_page_text).to include("Password")
  end

  it "Try logging in with the wrong password" do
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("SisAdmin@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("wrong")
    $browser.find_element(:name, "loginForm").click
    expect($browser.title).to eq("Log in - VIVO")
    expect(browser_page_text).to include("Log in")
    expect(browser_page_text).to include("The email or password you entered is incorrect.")
  end

  it "Login with the correct password" do
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("SisAdmin@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("myPassword")
    $browser.find_element(:name, "loginForm").click
    expect($browser.title).to eq("Log in - VIVO")
  end

  it "Now need to set a new password" do
    expect(browser_page_text).to include("New Password")
    expect(browser_page_text).to include("Confirm Password")
  end

  it "Cancel out before doing anything" do
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("VIVO")
  end

  it "Login with the correct password again" do
    $browser.find_element(:link_text, "Log in").click
    expect($browser.title).to eq("Log in - VIVO")
    expect(browser_page_text).to include("Log in")
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("SisAdmin@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("myPassword")
    $browser.find_element(:name, "loginForm").click
    expect($browser.title).to eq("Log in - VIVO")
  end

  it "Try entering nothing in both fields" do
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("")
    $browser.find_element(:name, "passwordChangeForm").click
    expect(browser_page_text).to include("Change Password to Log in")
  end

  it "Enter in an invalid password" do
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("junky")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("junky")
    $browser.find_element(:name, "passwordChangeForm").click
    expect(browser_page_text).to include("Please enter a password between 6 and 12 characters in length.")
  end

  it "Try using the original password as the new password" do
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("myPassword")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("myPassword")
    $browser.find_element(:name, "passwordChangeForm").click
    expect(browser_page_text).to include("Your new password cannot match the current one.")
  end

  it "Try entering in different passwords in each field" do
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("newPassword")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("newPasword")
    $browser.find_element(:name, "passwordChangeForm").click
    expect(browser_page_text).to include("The passwords entered do not match.")
  end

  it "Enter valid passwords" do
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("newPassword")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("newPassword")
    $browser.find_element(:name, "passwordChangeForm").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify new account is logged in and has access to correct options" do
    expect(browser_page_text).to include("Sis")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect($browser.find_elements(:link_text, "My profile").size).to eq(0)
  end

  it "log out" do
    vivo_logout
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
