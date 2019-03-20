shared_examples "Proxy Editing: Delete New Users" do
  it "Delete all test user account" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Go to User Accounts" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "User accounts").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify 3 user accounts exist before trying to delete them" do
    expect(browser_page_text).to include("8 accounts")
    $browser.find_element(:link_text, "EddieEditor@mydomain.edu")
    $browser.find_element(:link_text, "JaneFaculty@mydomain.edu")
    $browser.find_element(:link_text, "PollyProxy@mydomain.edu")
  end

  it "Delete first account" do
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:name, "deleteAccount").click
    $browser.find_element(:name, "delete-account").click
    browser_accept_alert("Are you sure you want to delete this account??")
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("7 accounts")
  end

  it "Delete second account" do
    $browser.find_element(:name, "deleteAccount").click
    $browser.find_element(:name, "delete-account").click
    browser_accept_alert("Are you sure you want to delete this account??")
    expect($browser.title).to eq("VIVO")
  end

  it "Delete third account" do
    $browser.find_element(:name, "deleteAccount").click
    $browser.find_element(:name, "delete-account").click
    browser_accept_alert("Are you sure you want to delete this account??")
    expect($browser.title).to eq("VIVO")
  end

  it "Verify 3 user accounts are gone" do
    expect($browser.find_elements(:link_text, "EddieEditor@mydomain.edu").size).to eq(0)
    expect($browser.find_elements(:link_text, "JaneFaculty@mydomain.edu").size).to eq(0)
    expect($browser.find_elements(:link_text, "PollyProxy@mydomain.edu").size).to eq(0)
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
