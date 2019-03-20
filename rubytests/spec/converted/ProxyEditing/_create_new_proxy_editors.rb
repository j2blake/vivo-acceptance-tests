shared_examples "Proxy Editing: Create New Proxy Editors" do
  it "Create Librarian person" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
  end

  it "Add new proxy editor 1" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "User accounts").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:css, "input.submit.add-account").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:id, "email-address").clear
    $browser.find_element(:id, "email-address").send_keys("PollyProxy@mydomain.edu")
    $browser.find_element(:id, "first-name").clear
    $browser.find_element(:id, "first-name").send_keys("Polly")
    $browser.find_element(:id, "last-name").clear
    $browser.find_element(:id, "last-name").send_keys("Proxy")
    $browser.find_element(:xpath, "(.//input[@name='role'])[4]").click
    $browser.find_element(:id, "initial-password").clear
    $browser.find_element(:id, "initial-password").send_keys("myPassword")
    $browser.find_element(:id, "confirm-password").clear
    $browser.find_element(:id, "confirm-password").send_keys("myPassword")
    $browser.find_element(:name, "submitAdd").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "PollyProxy@mydomain.edu")
  end

  it "Add new proxy editor 2" do
    $browser.find_element(:css, "input.submit.add-account").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:id, "email-address").clear
    $browser.find_element(:id, "email-address").send_keys("EddieEditor@mydomain.edu")
    $browser.find_element(:id, "first-name").clear
    $browser.find_element(:id, "first-name").send_keys("Eddie")
    $browser.find_element(:id, "last-name").clear
    $browser.find_element(:id, "last-name").send_keys("Editor")
    $browser.find_element(:xpath, "(.//input[@name='role'])[4]").click
    $browser.find_element(:id, "initial-password").clear
    $browser.find_element(:id, "initial-password").send_keys("myPassword")
    $browser.find_element(:id, "confirm-password").clear
    $browser.find_element(:id, "confirm-password").send_keys("myPassword")
    $browser.find_element(:name, "submitAdd").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "EddieEditor@mydomain.edu")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
