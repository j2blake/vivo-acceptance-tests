shared_examples "Admin Security: Admin Bad Login" do
  it "Bad login attempt for admin account" do
  end

  it "Enter incorrect password" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "incorrect")
    expect($browser.title).to eq("Log in - VIVO")
    expect(browser_page_text).to include("The email or password you entered is incorrect.")
  end

  it "Enter incorrect username" do
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("testAdm")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("Password")
    $browser.find_element(:name, "loginForm").click
    expect($browser.title).to eq("Log in - VIVO")
    expect(browser_page_text).to include("The email or password you entered is incorrect.")
  end

  it "Never logged in correctly" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
