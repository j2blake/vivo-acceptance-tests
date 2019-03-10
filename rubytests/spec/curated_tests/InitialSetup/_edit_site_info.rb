shared_examples "Initial Setup: Edit Site Info" do
  it "Change site name, tagline, and copyright (then reset it  to default)" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
    browser_wait_for_jQuery
  end

  it "Check screen layout when not logged in" do
    expect(browser_page_text).to include("Welcome to VIVO")
    expect(browser_page_text).to include("VIVO is a research-focused discovery tool that enables collaboration among scholars of all disciplines.")
    expect(browser_page_text).to include("Browse or search information on people, departments, courses, grants, and publications.")
    expect(browser_page_text).to include("Log in")
    expect(browser_page_text).to include("Email")
    expect(browser_page_text).to include("Password")
    expect($browser.find_element(:name, "loginForm")["value"]).to eq("Log in")
    $browser.find_element(:name, "loginForm")
    expect(browser_page_text).to include("Search VIVO")
    expect($browser.find_element(:css, "input.search")["value"]).to eq("Search")
    $browser.find_element(:css, "input.search")
    $browser.find_element(:css, "h4")
    expect(browser_page_text).to include("No research content found.")
    $browser.find_element(:css, "#home-faculty-mbrs > h4")
    expect(browser_page_text).to include("No faculty members found.")
    $browser.find_element(:css, "#home-academic-depts > h4")
    expect(browser_page_text).to include("No academic departments found.")
    #>>>  Can't locate this after AJAX call
    #>>>  #<tr><td>verifyElementPresent</td><td>css=#home-stats &gt; h4</td><td></td></tr>
    #>>>  Can't locate this after AJAX call
    #>>>  #<tr><td>verifyElementPresent</td><td>css=p.stats-count</td><td></td></tr>
    expect(browser_page_text).to include("©2019 VIVO Project")
    $browser.find_element(:link_text, "Terms of Use")
    expect(browser_page_text).to include("Powered by VIVO")
    $browser.find_element(:link_text, "VIVO")
    expect(browser_page_text).not_to include("Version")
    expect($browser.find_elements(:link_text, "unknown").size).to eq(0)
    $browser.find_element(:link_text, "About")
    $browser.find_element(:link_text, "Support")
  end

  it "Must be logged out" do
  end

  it "Must login as site admin" do
    vivo_login_as("testAdmin@mydomain.edu", "Password")
    browser_wait_for_jQuery
  end

  it "Check screen layout when logged in" do
    expect(browser_page_text).to include("Welcome to VIVO")
    expect(browser_page_text).to include("VIVO is a research-focused discovery tool that enables collaboration among scholars of all disciplines.")
    expect(browser_page_text).to include("Browse or search information on people, departments, courses, grants, and publications.")
    expect(browser_page_text).not_to include("Log in")
    expect(browser_page_text).not_to include("Email")
    expect(browser_page_text).not_to include("Password")
    expect(browser_page_text).to include("Search VIVO")
    expect($browser.find_element(:css, "input.search")["value"]).to eq("Search")
    $browser.find_element(:css, "input.search")
    $browser.find_element(:css, "h4")
    expect(browser_page_text).to include("No research content found.")
    $browser.find_element(:css, "#home-faculty-mbrs > h4")
    expect(browser_page_text).to include("No faculty members found.")
    $browser.find_element(:css, "#home-academic-depts > h4")
    expect(browser_page_text).to include("No academic departments found.")
    #>>>  Can't locate this after AJAX call
    #>>>  #<tr><td>verifyElementPresent</td><td>css=#home-stats &gt; h4</td><td></td></tr>
    #>>>  Can't locate this after AJAX call
    #>>>  #<tr><td>verifyElementPresent</td><td>css=p.stats-count</td><td></td></tr>
    expect(browser_page_text).to include("©2019 VIVO Project")
    $browser.find_element(:link_text, "Terms of Use")
    expect(browser_page_text).to include("Powered by VIVO")
    $browser.find_element(:link_text, "VIVO")
    $browser.find_element(:link_text, "About")
    $browser.find_element(:link_text, "Support")
  end

  it "Navigate to Site Configuraton page" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Site information").click
    expect($browser.title).to eq("Site Information")
  end

  it "Verify screen layout correct" do
    expect(browser_page_text).to include("Site Information")
    expect(browser_page_text).to include("Editing Existing Record")
    expect(browser_page_text).to include("Site name (max 50 characters)")
    expect($browser.find_element(:name, "ApplicationName")["value"]).to eq("VIVO")
    $browser.find_element(:name, "ApplicationName")
    expect(browser_page_text).to include("Contact email address contact form submissions will be sent to this address")
    expect($browser.find_element(:name, "ContactMail")["value"]).to eq("")
    $browser.find_element(:name, "ContactMail")
    expect(browser_page_text).to include("Theme")
    $browser.find_element(:id, "ThemeDir")
    expect(browser_page_text).to include("Copyright text used in footer (e.g., name of your institution)")
    expect($browser.find_element(:name, "CopyrightAnchor")["value"]).to eq("VIVO Project")
    $browser.find_element(:name, "CopyrightAnchor")
    expect(browser_page_text).to include("Copyright URL copyright text links to this URL")
    expect($browser.find_element(:name, "CopyrightURL")["value"]).to eq("")
    $browser.find_element(:name, "CopyrightURL")
    expect($browser.find_element(:id, "primaryAction")["value"]).to eq("Save changes")
    $browser.find_element(:id, "primaryAction")
    expect($browser.find_element(:name, "_cancel")["value"]).to eq("Cancel")
    $browser.find_element(:name, "_cancel")
  end

  it "Change site information fields" do
    $browser.find_element(:name, "ApplicationName").clear
    $browser.find_element(:name, "ApplicationName").send_keys("VIVO Test Site")
    $browser.find_element(:name, "ContactMail").clear
    $browser.find_element(:name, "ContactMail").send_keys("hlm7@mydomain.edu")
    browser_find_select_list(:id, "ThemeDir").select_by(:text, "vitro")
    browser_find_select_list(:id, "ThemeDir").select_by(:text, "wilma")
    $browser.find_element(:name, "CopyrightAnchor").clear
    $browser.find_element(:name, "CopyrightAnchor").send_keys("VIVO Project 2013")
    $browser.find_element(:name, "CopyrightURL").clear
    $browser.find_element(:name, "CopyrightURL").send_keys("vivoweb.org")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("VIVO Test Site Site Administration")
    expect(browser_page_text).to include("Site Configuration")
    $browser.find_element(:link_text, "Home").click
  end

  it "Verify that changes were made (cannot test site name)" do
    expect($browser.title).to eq("VIVO Test Site")
    expect(browser_page_text).to include("VIVO Project 2013")
    expect(browser_page_text).to include("©2019")
    $browser.find_element(:link_text, "VIVO Project 2013")
    $browser.find_element(:link_text, "Terms of Use")
    expect(browser_page_text).to include("Powered by VIVO")
    $browser.find_element(:link_text, "VIVO")
  end

  it "Set site information back to default" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Test Site Site Administration")
    $browser.find_element(:link_text, "Site information").click
    expect($browser.title).to eq("Site Information")
    $browser.find_element(:name, "ApplicationName").clear
    $browser.find_element(:name, "ApplicationName").send_keys("VIVO")
    $browser.find_element(:name, "ContactMail").clear
    $browser.find_element(:name, "ContactMail").send_keys("")
    browser_find_select_list(:id, "ThemeDir").select_by(:text, "vitro")
    browser_find_select_list(:id, "ThemeDir").select_by(:text, "wilma")
    $browser.find_element(:name, "CopyrightAnchor").clear
    $browser.find_element(:name, "CopyrightAnchor").send_keys("VIVO Project")
    $browser.find_element(:name, "CopyrightURL").clear
    $browser.find_element(:name, "CopyrightURL").send_keys("")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Verify that changes were set back to the default" do
    $browser.navigate.to vivo_url("/")
    expect(browser_page_text).to include("VIVO Project")
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("VIVO Project")
    expect(browser_page_text).to include("©2019 VIVO Project")
    $browser.find_element(:link_text, "Terms of Use")
    expect(browser_page_text).to include("Powered by VIVO")
    $browser.find_element(:link_text, "VIVO")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Log in")
    end
  end
