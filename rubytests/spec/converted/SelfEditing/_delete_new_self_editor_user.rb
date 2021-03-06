shared_examples "Self Editing: Delete New Self Editor User" do
  it "Delete new self-editor user account" do
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
    $browser.find_element(:link_text, "JaneFaculty@mydomain.edu")
  end

  it "Delete the account" do
    $browser.find_element(:name, "deleteAccount").click
    $browser.find_element(:name, "delete-account").click
    browser_accept_alert("Are you sure you want to delete this account??")
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("User accounts")
    expect(browser_page_text).to include("Deleted 1 account.")
    expect($browser.find_elements(:link_text, "JaneFaculty@mydomain.edu").size).to eq(0)
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
