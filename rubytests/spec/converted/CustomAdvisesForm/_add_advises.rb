shared_examples "Custom Advises Form: Add Advises" do
  it "Validate this form and add advises" do
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

  it "Select advises editing" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[29]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create advisor relationship entry for Faculty, Jane")
    expect(browser_page_text).to include("Advising Relationship Type")
    expect(browser_page_text).to include("Advisee: Last name")
    expect(browser_page_text).to include("First name")
    expect(browser_page_text).to include("Subject Area")
    expect(browser_page_text).to include("Degree Candidacy")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
  end

  it "Cancel without adding anything" do
    $browser.find_element(:link_text, "Cancel").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[29]").click
    expect($browser.title).to eq("Edit")
  end

  it "Add only type, which results in error" do
    browser_find_select_list(:id, "selector").select_by(:text, "Undergraduate Advising Relationship")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("You must enter a value in the Last Name field.")
    expect(browser_page_text).to include("You must enter a value in the First Name field.")
  end

  it "Add only type and last name, which results in error" do
    browser_find_select_list(:id, "selector").select_by(:text, "Undergraduate Advising Relationship")
    $browser.find_element(:id, "advisee").clear
    $browser.find_element(:id, "advisee").send_keys("Smith")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("You must enter a value in the First Name field.")
  end

  it "Add only type and first name, which results in error" do
    browser_find_select_list(:id, "selector").select_by(:text, "Undergraduate Advising Relationship")
    $browser.find_element(:id, "advisee").clear
    $browser.find_element(:id, "advisee").send_keys("")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Joe")
    $browser.find_element(:css, "input.submit").click
    expect(browser_page_text).to include("You must enter a value in the Last Name field.")
  end

  it "Add only type. last name, and first name, which should be accepted" do
    browser_find_select_list(:id, "selector").select_by(:text, "Undergraduate Advising Relationship")
    $browser.find_element(:id, "advisee").clear
    $browser.find_element(:id, "advisee").send_keys("Smith")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Joe")
    $browser.find_element(:css, "input.submit").click
  end

  it "Verify display of first advises" do
    expect(browser_page_text).to include("undergraduate advising relationship")
    $browser.find_element(:link_text, "Smith, Joe")
  end

  it "Add a second advises, including all fields" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[29]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "selector").select_by(:text, "Graduate Advising Relationship")
    $browser.find_element(:id, "advisee").clear
    $browser.find_element(:id, "advisee").send_keys("Doe")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("John")
    $browser.find_element(:id, "SubjectArea").clear
    $browser.find_element(:id, "SubjectArea").send_keys("Primates")
    browser_find_select_list(:id, "degreeUri").select_by(:text, "M.S. Master of Science")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2008")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2011")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify display of first and second advises" do
    expect(browser_page_text).to include("undergraduate advising relationship")
    $browser.find_element(:link_text, "Smith, Joe")
    expect(browser_page_text).to include("graduate advising relationship")
    expect(browser_page_text).to include("Doe, John, M.S.  candidate, 2008 - 2011")
    $browser.find_element(:link_text, "Doe, John")
  end

  it "Add a third advises, exluding degree and end date" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[29]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "selector").select_by(:text, "Faculty Mentoring Relationship")
    $browser.find_element(:id, "advisee").clear
    $browser.find_element(:id, "advisee").send_keys("Adams")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Jeff")
    $browser.find_element(:id, "SubjectArea").clear
    $browser.find_element(:id, "SubjectArea").send_keys("Primate Health")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2012")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify all 3 advises together" do
    expect(browser_page_text).to include("faculty mentoring relationship")
    expect(browser_page_text).to include("Adams, Jeff, 2012 -")
    $browser.find_element(:link_text, "Adams, Jeff")
    expect(browser_page_text).to include("graduate advising relationship")
    expect(browser_page_text).to include("Doe, John, M.S.  candidate, 2008 - 2011")
    $browser.find_element(:link_text, "Doe, John")
    expect(browser_page_text).to include("undergraduate advising relationship")
    expect(browser_page_text).to include("Smith, Joe")
    $browser.find_element(:link_text, "Smith, Joe")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
