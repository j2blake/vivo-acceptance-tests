shared_examples "Create Accounts: Create New Self Editor User" do
  it "Create a new unprivileged user" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Create a new user" do
    $browser.find_element(:link_text, "Site Admin").click
    $browser.find_element(:link_text, "User accounts").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("User accounts")
    expect(browser_page_text).to include("5 accounts")
    $browser.find_element(:xpath, ".//input[@value='Add new account']").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("User accounts > Add new account")
    $browser.find_element(:id, "email-address").clear
    $browser.find_element(:id, "email-address").send_keys("RickRookie@mydomain.edu")
    $browser.find_element(:id, "first-name").clear
    $browser.find_element(:id, "first-name").send_keys("Rick")
    $browser.find_element(:id, "last-name").clear
    $browser.find_element(:id, "last-name").send_keys("Rookie")
    $browser.find_element(:xpath, "(.//input[@name='role'])[4]").click
    $browser.find_element(:id, "initial-password").clear
    $browser.find_element(:id, "initial-password").send_keys("myPassword")
    $browser.find_element(:id, "confirm-password").clear
    $browser.find_element(:id, "confirm-password").send_keys("myPassword")
    $browser.find_element(:name, "submitAdd").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify account" do
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    expect(browser_page_text).to include("6 accounts")
    $browser.find_element(:link_text, "RickRookie@mydomain.edu")
    expect(browser_page_text).to include("Rick")
    expect(browser_page_text).to include("Rookie")
    expect(browser_page_text).to include("ACTIVE")
    expect(browser_page_text).to include("Self Editor")
    expect(browser_page_text).to include("0")
  end

  it "Logout" do
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
