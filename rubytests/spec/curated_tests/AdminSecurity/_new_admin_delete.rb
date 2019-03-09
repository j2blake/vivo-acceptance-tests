shared_examples "Admin Security: New Admin Delete" do
  it "Remove test site admin account" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
  end

  it "Select User accounts option from Site Admin page" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "User accounts").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("User accounts")
  end

  it "Verify that Sis Admin account does indeed exist" do
    $browser.find_element(:link_text, "SisAdmin@mydomain.edu")
  end

  it "Delete Sis Admin account" do
    $browser.find_element(:name, "deleteAccount").click
    $browser.find_element(:xpath, ".//form[@id='account-display']/section[2]/input").click
    expect($browser.switch_to.alert.text).to eq("Are you sure you want to delete this account??")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Deleted 1 account.")
    expect(browser_page_text).to include("User accounts")
  end

  it "Verify Sis Admin account is gone" do
    expect($browser.find_elements(:id, "=SisAdmin@mydomain.edu").size).to eq(0)
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
