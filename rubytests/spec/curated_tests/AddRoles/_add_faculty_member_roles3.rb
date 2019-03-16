shared_examples "Add Roles: Add Faculty Member Roles3" do
  it "Add new attendance role" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
  end

  it "Navigate to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Cancel out before adding attendee role" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[12]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Faculty, Jane : Add a new participation")
    expect(browser_page_text).to include("Event Type")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Cancel out after selecting event type" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[12]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Faculty, Jane : Add a new participation")
    expect(browser_page_text).to include("Event Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Conference")
    $browser.find_element(:link_text, "Cancel").click
  end

  it "Enter attendance at conference" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[12]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Conference")
    expect(browser_page_text).to include("Faculty, Jane : Add a new participation")
    expect(browser_page_text).to include("Event Type")
    expect(browser_page_text).to include("Event Name")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year (YYYY)")
    expect(browser_page_text).to include("End Year (YYYY)")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Conference")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("PoA Annual Conference")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2000")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Navigate back to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify display" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    expect(browser_page_text).to include("PoA Annual Conference 2000 - 2010")
    $browser.find_element(:link_text, "PoA Annual Conference")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
