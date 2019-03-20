shared_examples "Custom Positions Form: Add Positions" do
  it "Validate this form and add positions" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to test faculty member via Index" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Select positions editing" do
    $browser.find_element(:xpath, ".//section[@id='individual-info']/header/h2/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create position entry for Faculty, Jane")
    expect(browser_page_text).to include("Organization Type")
    expect(browser_page_text).to include("Organization Name")
    expect(browser_page_text).to include("Position Title")
    expect(browser_page_text).to include("Position Type")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
  end

  it "Cancel without adding anything" do
    $browser.find_element(:link_text, "Cancel").click
    $browser.find_element(:xpath, ".//section[@id='individual-info']/header/h2/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create position entry for Faculty, Jane")
    expect(browser_page_text).to include("Organization Type")
    expect(browser_page_text).to include("Organization Name")
    expect(browser_page_text).to include("Position Title")
    expect(browser_page_text).to include("Position Type")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
  end

  it "Add only organization name, which results in error" do
    browser_find_select_list(:id, "typeSelector").select_by(:text, "College")
    $browser.find_element(:id, "orgLabel").clear
    $browser.find_element(:id, "orgLabel").send_keys("Carroll College")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please enter a value in the Position Title field.")
    expect(browser_page_text).to include("Please select a value in the Position Type field.")
  end

  it "Add position title, but leave position type and start year blank" do
    $browser.find_element(:id, "positionTitle").clear
    $browser.find_element(:id, "positionTitle").send_keys("Lecturer")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please select a value in the Position Type field.")
  end

  it "Enter in all fields except for end year" do
    browser_find_select_list(:name, "positionType").select_by(:text, "Faculty Administrative Position")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1971")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
    vivo_click_and_wait_for_indexing(:id, "submit")
  end

  it "Verify first position is listed properly" do
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Lecturer, Carroll College 1971 -")
  end

  it "Add second position using same organization" do
    $browser.find_element(:xpath, ".//section[@id='individual-info']/header/h2/a/img").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "University")
    $browser.find_element(:id, "orgLabel").clear
    $browser.find_element(:id, "orgLabel").send_keys("Carroll University")
    $browser.find_element(:id, "positionTitle").clear
    $browser.find_element(:id, "positionTitle").send_keys("Assistant Professor")
    browser_find_select_list(:name, "positionType").select_by(:text, "Faculty Position")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1981")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("1985")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify both positions are listed properly" do
    expect(browser_page_text).to include("Lecturer, Carroll College 1971 -")
    expect(browser_page_text).to include("Assistant Professor, Carroll University 1981 - 1985")
  end

  it "Add third position using new organization" do
    $browser.find_element(:xpath, ".//section[@id='individual-info']/header/h2/a/img").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "University")
    $browser.find_element(:id, "orgLabel").clear
    $browser.find_element(:id, "orgLabel").send_keys("Cornell University")
    $browser.find_element(:id, "positionTitle").clear
    $browser.find_element(:id, "positionTitle").send_keys("Assistant Professor")
    browser_find_select_list(:name, "positionType").select_by(:text, "Faculty Position")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1986")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify all three positions show up" do
    expect(browser_page_text).to include("Lecturer, Carroll College 1971 -")
    expect(browser_page_text).to include("Assistant Professor, Cornell University 1986 - 2010")
    expect(browser_page_text).to include("Assistant Professor, Carroll University 1981 - 1985")
    $browser.find_element(:link_text, "Carroll College")
    $browser.find_element(:link_text, "Cornell University")
    $browser.find_element(:link_text, "Carroll University")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
