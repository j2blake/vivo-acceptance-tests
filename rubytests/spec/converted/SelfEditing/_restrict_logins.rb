shared_examples "Self Editing: Restrict Logins" do
  it "Test restricting logins" do
  end

  it "Must login " do
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("testAdmin@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("Password")
    $browser.find_element(:name, "loginForm").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Restrict logins" do
    $browser.find_element(:link_text, "Restrict logins").click
    expect($browser.title).to eq("Restrict Logins")
    expect(browser_page_text).to include("Restrict Logins")
    expect(browser_page_text).to include("Logins are open to all")
    $browser.find_element(:link_text, "Restrict Logins")
    $browser.find_element(:link_text, "Restrict Logins").click
    expect($browser.title).to eq("Restrict Logins")
    expect(browser_page_text).to include("Restrict Logins")
    expect(browser_page_text).to include("Logins are now restricted.")
    expect(browser_page_text).to include("Logins are restricted")
    $browser.find_element(:link_text, "Remove Restrictions")
  end

  it "Now login as a self editor and attempt to edit" do
    vivo_logout
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("JaneFaculty@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("Password")
    $browser.find_element(:name, "loginForm").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("User logins are temporarily disabled while the system is being maintained.")
  end

  it "Turn login restriction off" do
    vivo_login_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Restrict logins").click
    expect($browser.title).to eq("Restrict Logins")
    $browser.find_element(:link_text, "Remove Restrictions").click
    expect($browser.title).to eq("Restrict Logins")
    expect(browser_page_text).to include("Restrict Logins")
    expect(browser_page_text).to include("Logins are no longer restricted.")
    expect(browser_page_text).to include("Logins are open to all")
    $browser.find_element(:link_text, "Restrict Logins")
  end

  it "Now login as a self editor and attempt to edit" do
    vivo_logout
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("JaneFaculty@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("Password")
    $browser.find_element(:name, "loginForm").click
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).not_to include("User logins are temporarily disabled while the system is being maintained.")
  end

  it "Logout now" do
    vivo_logout
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
