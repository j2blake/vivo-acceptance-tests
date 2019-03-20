shared_examples "Create People: Create Faculty Member" do
  it "Add a Faculty member named Jane Faculty" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    expect(browser_page_text).to include("Data Input")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member (vivo)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
  end

  it "Add Jane Faculty" do
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Jane")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Faculty")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Make Jane Faculty an Assistant Professor" do
    $browser.find_element(:css, "[title=\"Add new preferred title entry\"]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "preferredTitle").clear
    $browser.find_element(:id, "preferredTitle").send_keys("Assistant Professor")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify that account was created" do
    expect(browser_page_text).to include("Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor")
  end

  it "Verify front page updated" do
    $browser.find_element(:link_text, "Home").click
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO")
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    expect(browser_page_text).to include("No research content found.")
    $browser.find_element(:link_text, "Faculty, Jane")
  end

  it "Logout" do
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
