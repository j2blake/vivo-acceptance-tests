shared_examples "Create Accounts: Delete New Others Users" do
  it "Delete new people Jane Faculty and Lilly Librarian" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "People").click
    expect($browser.title).to eq("People")
  end

  it "Navigate to Jane Faculty" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("faculty")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Delete Jane Faculty" do
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:id, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Lilly Librarian" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("librarian")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Delete Lilly Librarian" do
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:id, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Paula Proxy" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("administrative")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    $browser.find_element(:link_text, "Proxy, Paula").click
    expect($browser.title).to eq("Proxy, Paula")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Delete Lilly Librarian" do
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:id, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Verify Jane Faculty, Lilly Librarian, and Paula Proxy are gone" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("faculty")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).not_to include("Faculty, Jane")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("librarian")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).not_to include("Librarian, Lily")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("administrative")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).not_to include("Librarian, Lily")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
