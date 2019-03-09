shared_examples "Create Accounts: Create New Curator User" do
  it "Create New Curator User" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Create a new user" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "User accounts").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("User accounts")
    $browser.find_element(:css, "input.submit.add-account").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:id, "email-address").clear
    $browser.find_element(:id, "email-address").send_keys("ConnieCurator@mydomain.edu")
    $browser.find_element(:id, "first-name").clear
    $browser.find_element(:id, "first-name").send_keys("Connie")
    $browser.find_element(:id, "last-name").clear
    $browser.find_element(:id, "last-name").send_keys("Curator")
    $browser.find_element(:xpath, "(.//input[@name='role'])[2]").click
    $browser.find_element(:id, "initial-password").clear
    $browser.find_element(:id, "initial-password").send_keys("myPassword")
    $browser.find_element(:id, "confirm-password").clear
    $browser.find_element(:id, "confirm-password").send_keys("myPassword")
    $browser.find_element(:name, "submitAdd").click
    expect($browser.title).to eq("VIVO")
  end

  it "Confirm values for new user" do
    expect(browser_page_text).to include("A new account for Connie Curator was successfully created.")
    $browser.find_element(:link_text, "ConnieCurator@mydomain.edu")
    expect($browser.find_element(:xpath, ".//tr[1]/td[1]").text).to eq("ConnieCurator@mydomain.edu")
    expect($browser.find_element(:xpath, ".//tr[1]/td[2]").text).to eq("Connie")
    expect($browser.find_element(:xpath, ".//tr[1]/td[3]").text).to eq("Curator")
    expect($browser.find_element(:xpath, ".//tr[1]/td[4]").text).to eq("ACTIVE")
    expect($browser.find_element(:xpath, ".//tr[1]/td[5]").text).to eq("Curator")
    expect($browser.find_element(:xpath, ".//tr[1]/td[6]").text).to eq("0")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
