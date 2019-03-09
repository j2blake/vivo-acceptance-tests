shared_examples "Admin Security: Admin Login Logout" do
  it "Test various login/logout processes" do
  end

  it "Access secure bookmarked page without being logged in" do
    $browser.navigate.to vivo_url("/siteAdmin")
    expect($browser.title).to eq("Log in - VIVO")
    expect(browser_page_text).to include("Log in")
    expect(browser_page_text).not_to include("testAdmin@mydomain.edu")
    expect(browser_page_text).not_to include("Site Admin")
  end

  it "Now login and verify secure page is brought up" do
    $browser.find_element(:name, "loginName").clear
    $browser.find_element(:name, "loginName").send_keys("testAdmin@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("Password")
    $browser.find_element(:name, "loginForm").click
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect(browser_page_text).to include("Log out")
    expect(browser_page_text).to include("Admin")
    expect(browser_page_text).to include("Site Admin")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect($browser.find_elements(:link_text, "My profile").size).to eq(0)
  end

  it "Verify available options" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    expect(browser_page_text).to include("Data Input")
    expect(browser_page_text).to include("Site Configuration")
    $browser.find_element(:link_text, "Institutional internal class")
    $browser.find_element(:link_text, "Manage profile editing")
    $browser.find_element(:link_text, "Page management")
    $browser.find_element(:link_text, "Menu ordering")
    $browser.find_element(:link_text, "Site information")
    $browser.find_element(:link_text, "Startup status")
    $browser.find_element(:link_text, "User accounts")
    expect(browser_page_text).to include("Ontology Editor")
    $browser.find_element(:link_text, "Ontology list")
    expect(browser_page_text).to include("Class Management")
    $browser.find_element(:link_text, "Class hierarchy")
    $browser.find_element(:link_text, "Class groups")
    expect(browser_page_text).to include("Property Management")
    $browser.find_element(:link_text, "Object property hierarchy")
    $browser.find_element(:link_text, "Data property hierarchy")
    $browser.find_element(:link_text, "Property groups")
    expect(browser_page_text).to include("Advanced Data Tools")
    $browser.find_element(:link_text, "Add/Remove RDF data")
    $browser.find_element(:link_text, "Ingest tools")
    $browser.find_element(:link_text, "RDF export")
    $browser.find_element(:link_text, "SPARQL query")
    expect(browser_page_text).to include("Site Maintenance")
    $browser.find_element(:link_text, "Rebuild search index")
    $browser.find_element(:link_text, "Rebuild visualization cache")
    $browser.find_element(:link_text, "Recompute inferences")
    $browser.find_element(:link_text, "Restrict logins")
    $browser.find_element(:link_text, "Activate developer panel")
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
    $browser.find_element(:name, "loginName").send_keys("testAdmin@mydomain.edu")
    $browser.find_element(:name, "loginPassword").clear
    $browser.find_element(:name, "loginPassword").send_keys("Password")
    $browser.find_element(:name, "loginForm").click
  end

  it "Go to a public page, logout, and log back in going to directly to public page" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    vivo_logout
    expect($browser.title).to eq("Index of Contents")
    expect(browser_page_text).to include("You have logged out.")
    $browser.find_element(:link_text, "Log in")
    vivo_login_as("testAdmin@mydomain.edu", "Password")
    vivo_logout
    expect($browser.title).to eq("Index of Contents")
    expect(browser_page_text).to include("You have logged out.")
    $browser.find_element(:link_text, "Log in")
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
