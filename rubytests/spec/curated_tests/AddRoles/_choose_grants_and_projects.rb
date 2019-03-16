shared_examples "Add Roles: Choose Grants And Projects" do
  it "Choose with Grants & Projects to Display" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify manage grants & projects option" do
    $browser.find_element(:id, "manageGrantLink").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Manage Grants & Projects for Jane Faculty")
    expect(browser_page_text).to include("Check those grants and projects you want to exclude from the profile page.")
    expect(browser_page_text).to include("Co-Principal Investigator Role")
    expect(browser_page_text).to include("NIH VIVO")
    expect(browser_page_text).to include("VIVO Cornell Grant")
    expect(browser_page_text).to include("Investigator Role")
    expect(browser_page_text).to include("VIVO Cornell Grant Too")
    expect(browser_page_text).to include("Principal Investigator Role")
    expect(browser_page_text).to include("NIH VIVO Too")
    expect(browser_page_text).to include("Researcher Role")
    expect(browser_page_text).to include("Habitats for Apes")
    expect(browser_page_text).to include("History of Apes in Africa")
    $browser.find_element(:link_text, "Return to profile page")
    $browser.find_element(:link_text, "Return to profile page").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Choose to not display anything" do
    $browser.find_element(:id, "manageGrantLink").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:css, "input.grantCheckbox").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[2]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[3]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[4]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[5]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[6]").click
    $browser.find_element(:link_text, "Return to profile page").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify everything is gone" do
    expect(browser_page_text).not_to include("NIH VIVO")
    expect(browser_page_text).not_to include("VIVO Cornell Grant")
    expect(browser_page_text).not_to include("VIVO Cornell Grant Too")
    expect(browser_page_text).not_to include("NIH VIVO Too")
    expect(browser_page_text).not_to include("Habitats for Apes")
    expect(browser_page_text).not_to include("History of Apes in Africa")
  end

  it "Add back two grants/projects" do
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
