shared_examples "Create Accounts: Check Curator Login Logout" do
  it "Test various login/logout processes" do
  end

  it "Access secure bookmarked page without being logged in" do
    $browser.navigate.to vivo_url("/siteAdmin")
    expect($browser.title).to eq("Log in - VIVO")
    expect(browser_page_text).to include("Log in")
    expect(browser_page_text).not_to include("Connie")
    expect(browser_page_text).not_to include("Site Admin")
  end

  it "Now login and verify secure page is brought up" do
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("ConnieCurator@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("newPassword")
    $browser.find_element(:name, "loginForm").click
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect(browser_page_text).to include("Log out")
    expect(browser_page_text).to include("Connie")
    expect(browser_page_text).to include("Site Admin")
  end

  it "Go to Site Information and then logout" do
    $browser.find_element(:link_text, "Site information").click
    expect($browser.title).to eq("Site Information")
    vivo_logout
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("You have logged out.")
    expect(browser_page_text).to include("Welcome to VIVO")
    expect(browser_page_text).to include("Log in")
  end

  it "Verify back on front page when logging back in" do
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("ConnieCurator@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("newPassword")
    $browser.find_element(:name, "loginForm").click
  end

  it "Go to a public page, logout, and log back in going to directly to public page" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    vivo_logout
    expect($browser.title).to eq("Index of Contents")
    expect(browser_page_text).to include("You have logged out.")
    $browser.find_element(:link_text, "Log in")
    vivo_login_as("ConnieCurator@mydomain.edu", "newPassword")
    expect($browser.title).to eq("Index of Contents")
    vivo_logout
    expect(browser_page_text).to include("You have logged out.")
    $browser.find_element(:link_text, "Log in")
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
