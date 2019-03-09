shared_examples "Admin Security: Admin Change Password" do
  it "Change password for admin account" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "Log in").click
    expect(browser_page_text).to include("Log in")
    expect($browser.title).to eq("Log in - VIVO")
  end

  it "Login with current password" do
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("testAdmin@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("Password")
    $browser.find_element(:name, "loginForm").click
    expect(browser_page_text).to include("Admin")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "Log out")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account").click
    expect($browser.title).to eq("VIVO")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect(browser_page_text).to include("My account")
    expect(browser_page_text).to include("New password")
    expect(browser_page_text).to include("Confirm new password")
  end

  it "Enter new password but not confirmation" do
    $browser.find_element(:id, "new-password").clear
    $browser.find_element(:id, "new-password").send_keys("onlynew")
    $browser.find_element(:id, "confirm-password").clear
    $browser.find_element(:id, "confirm-password").send_keys("")
    $browser.find_element(:id, "submitMyAccount").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Passwords do not match.")
  end

  it "Enter confirmation but not new password" do
    $browser.find_element(:id, "new-password").clear
    $browser.find_element(:id, "new-password").send_keys("")
    $browser.find_element(:id, "confirm-password").clear
    $browser.find_element(:id, "confirm-password").send_keys("onlyconfirm")
    $browser.find_element(:id, "submitMyAccount").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Passwords do not match.")
  end

  it "Enter passwords that do not match" do
    $browser.find_element(:id, "new-password").clear
    $browser.find_element(:id, "new-password").send_keys("Password2")
    $browser.find_element(:id, "confirm-password").clear
    $browser.find_element(:id, "confirm-password").send_keys("incorrect2")
    $browser.find_element(:id, "submitMyAccount").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Passwords do not match.")
  end

  it "Enter password that is not long enough" do
    $browser.find_element(:id, "new-password").clear
    $browser.find_element(:id, "new-password").send_keys("junky")
    $browser.find_element(:id, "confirm-password").clear
    $browser.find_element(:id, "confirm-password").send_keys("junky")
    $browser.find_element(:id, "submitMyAccount").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Please enter a password between 6 and 12 characters in length.")
  end

  it "Enter passwords that do match and are 6 characters long" do
    $browser.find_element(:id, "new-password").clear
    $browser.find_element(:id, "new-password").send_keys("goody2")
    $browser.find_element(:id, "confirm-password").clear
    $browser.find_element(:id, "confirm-password").send_keys("goody2")
    $browser.find_element(:id, "submitMyAccount").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Your changes have been saved.")
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Log in")
  end

  it "Login with new password" do
    vivo_login_as("testAdmin@mydomain.edu", "goody2")
    expect($browser.title).to eq("VIVO")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account").click
    expect($browser.title).to eq("VIVO")
  end

  it "Change password back" do
    $browser.find_element(:id, "new-password").clear
    $browser.find_element(:id, "new-password").send_keys("Password")
    $browser.find_element(:id, "confirm-password").clear
    $browser.find_element(:id, "confirm-password").send_keys("Password")
    $browser.find_element(:id, "submitMyAccount").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Your changes have been saved.")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
