shared_examples "Custom Advises Form: Change Advises" do
  it "Change 3 existing advises" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to test faculty member" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify advises to be edited exist" do
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

  it "Add degree to faculty mentoring relationship plus change start date" do
    $browser.find_element(:css, "a.edit-RO_0000053 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "degreeUri").select_by(:text, "Ph.D. Doctor of Philosophy")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2011")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify advises are still listed correctly" do
    expect(browser_page_text).to include("faculty mentoring relationship")
    expect(browser_page_text).to include("Adams, Jeff, Ph.D.  candidate, 2011 -")
    $browser.find_element(:link_text, "Adams, Jeff")
    expect(browser_page_text).to include("graduate advising relationship")
    expect(browser_page_text).to include("Doe, John, M.S.  candidate, 2008 - 2011")
    $browser.find_element(:link_text, "Doe, John")
    expect(browser_page_text).to include("undergraduate advising relationship")
    expect(browser_page_text).to include("Smith, Joe")
    $browser.find_element(:link_text, "Smith, Joe")
  end

  it "Change the degree for graduate advising relationship plus years" do
    $browser.find_element(:xpath, "(.//img[@alt='edit this entry'])[3]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "degreeUri").select_by(:text, "M.Sc. Master of Science")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2007")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2012")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify advises are still listed correctly" do
    expect(browser_page_text).to include("faculty mentoring relationship")
    expect(browser_page_text).to include("Adams, Jeff, Ph.D.  candidate, 2011 -")
    $browser.find_element(:link_text, "Adams, Jeff")
    expect(browser_page_text).to include("graduate advising relationship")
    expect(browser_page_text).to include("Doe, John, M.Sc.  candidate, 2007 - 2012")
    $browser.find_element(:link_text, "Doe, John")
    expect(browser_page_text).to include("undergraduate advising relationship")
    expect(browser_page_text).to include("Smith, Joe")
    $browser.find_element(:link_text, "Smith, Joe")
  end

  it "Add a degree and start year for undergraduate advising relationship" do
    $browser.find_element(:xpath, "(.//img[@alt='edit this entry'])[4]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "degreeUri").select_by(:text, "B.Sc. Bachelor of Science")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2009")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify advises are still listed correctly" do
    expect(browser_page_text).to include("faculty mentoring relationship")
    expect(browser_page_text).to include("Adams, Jeff, Ph.D.  candidate, 2011 -")
    $browser.find_element(:link_text, "Adams, Jeff")
    expect(browser_page_text).to include("graduate advising relationship")
    expect(browser_page_text).to include("Doe, John, M.Sc.  candidate, 2007 - 2012")
    $browser.find_element(:link_text, "Doe, John")
    expect(browser_page_text).to include("undergraduate advising relationship")
    expect(browser_page_text).to include("Smith, Joe, B.Sc.  candidate, 2009 -")
    $browser.find_element(:link_text, "Smith, Joe")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
