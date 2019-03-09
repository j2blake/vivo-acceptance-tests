shared_examples "Admin Security: New Admin Account" do
  it "Create a second site admin account" do
  end

  it "Must not be logged in" do
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

  it "Verify test account does not exist already" do
    expect(browser_page_text).not_to include("SisAdmin@mydomain.edu")
  end

  it "Add new site admin account without the First Name" do
    $browser.find_element(:css, "input.submit.add-account").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:id, "email-address").clear
    $browser.find_element(:id, "email-address").send_keys("SisAdmin@mydomain.edu")
    $browser.find_element(:id, "first-name").clear
    $browser.find_element(:id, "first-name").send_keys("Sis")
    $browser.find_element(:id, "last-name").clear
    $browser.find_element(:id, "last-name").send_keys("Admin")
    $browser.find_element(:xpath, "(.//input[@name='role'])[1]").click
    $browser.find_element(:id, "initial-password").clear
    $browser.find_element(:id, "initial-password").send_keys("myPassword")
    $browser.find_element(:id, "confirm-password").clear
    $browser.find_element(:id, "confirm-password").send_keys("myPassword")
    $browser.find_element(:name, "submitAdd").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify new account has successfully been added" do
    expect(browser_page_text).to include("A new account for Sis Admin was successfully created.")
    $browser.find_element(:link_text, "SisAdmin@mydomain.edu")
    expect($browser.find_element(:xpath, ".//tr[1]/td[1]").text).to eq("SisAdmin@mydomain.edu")
    expect($browser.find_element(:xpath, ".//tr[1]/td[2]").text).to eq("Sis")
    expect($browser.find_element(:xpath, ".//tr[1]/td[3]").text).to eq("Admin")
    expect($browser.find_element(:xpath, ".//tr[1]/td[4]").text).to eq("ACTIVE")
    expect($browser.find_element(:xpath, ".//tr[1]/td[5]").text).to eq("Site Admin")
    expect($browser.find_element(:xpath, ".//tr[1]/td[6]").text).to eq("0")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
