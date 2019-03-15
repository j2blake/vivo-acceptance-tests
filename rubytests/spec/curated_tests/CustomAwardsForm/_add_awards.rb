shared_examples "Custom Awards Form: Add Awards" do
  it "Validate this form and add awards" do
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

  it "Select awards editing" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[40]").click
    expect($browser.title).to eq("Edit")
  end

  it "Cancel without adding anything" do
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add only organization name, which results in error" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[40]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "org").clear
    $browser.find_element(:id, "org").send_keys("Carroll College")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please select an existing value or enter a new value in the Award or Honor Name field.")
  end

  it "Add rest of info" do
    $browser.find_element(:id, "award").clear
    $browser.find_element(:id, "award").send_keys("Best Professor")
    $browser.find_element(:id, "org").clear
    $browser.find_element(:id, "org").send_keys("Carroll College")
    $browser.find_element(:id, "description").clear
    $browser.find_element(:id, "description").send_keys("Yearly award for the best professor across departments.")
    $browser.find_element(:id, "yearAwardedDisplay").clear
    $browser.find_element(:id, "yearAwardedDisplay").send_keys("2012")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify first award is listed properly" do
    expect(browser_page_text).to include("Best Professor, conferred by Carroll College, 2012")
    $browser.find_element(:link_text, "Best Professor")
    $browser.find_element(:link_text, "Carroll College")
  end

  it "Add second award using same organization" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[40]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "award").clear
    $browser.find_element(:id, "award").send_keys("Professor of the Decade")
    $browser.find_element(:id, "org").send_keys("Carr")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "yearAwardedDisplay").clear
    $browser.find_element(:id, "yearAwardedDisplay").send_keys("2010")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2000")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify both awards are listed properly" do
    expect(browser_page_text).to include("Best Professor, conferred by Carroll College, 2012")
    $browser.find_element(:link_text, "Best Professor")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Professor of the Decade, conferred by Carroll College, 2010")
    $browser.find_element(:link_text, "Professor of the Decade")
    $browser.find_element(:link_text, "Carroll College")
  end

  it "Add third award using new organization" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[40]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "award").clear
    $browser.find_element(:id, "award").send_keys("Primate Expert")
    $browser.find_element(:id, "org").clear
    $browser.find_element(:id, "org").send_keys("Primates-R-Us")
    $browser.find_element(:id, "description").clear
    $browser.find_element(:id, "description").send_keys("Yearly award for the person who does the most to improve the life of primates.")
    $browser.find_element(:id, "yearAwardedDisplay").clear
    $browser.find_element(:id, "yearAwardedDisplay").send_keys("2005")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify all three positions show up" do
    expect(browser_page_text).to include("Best Professor, conferred by Carroll College, 2012")
    $browser.find_element(:link_text, "Best Professor")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Professor of the Decade, conferred by Carroll College, 2010")
    $browser.find_element(:link_text, "Professor of the Decade")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Primate Expert, conferred by Primates-R-Us, 2005")
    $browser.find_element(:link_text, "Primate Expert")
    $browser.find_element(:link_text, "Primates-R-Us")
  end

  it "Verify deeper" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:link_text, "Best Professor").click
    expect($browser.title).to eq("Best Professor")
    expect(browser_page_text).to include("Best Professor")
    expect(browser_page_text).to include("Award or Honor")
    $browser.find_element(:link_text, "Best Professor (Faculty, Jane - 2012)")
    $browser.find_element(:css, "a[title=\"name\"]").click
    expect($browser.title).to eq("Best Professor (Faculty, Jane - 2012)")
    expect(browser_page_text).to include("Yearly award for the best professor across departments.")
    $browser.find_element(:link_text, "Best Professor")
    expect(browser_page_text).to include("Faculty, Jane   Assistant Professor")
    $browser.find_element(:link_text, "Faculty, Jane")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("2012")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:link_text, "Professor of the Decade").click
    expect($browser.title).to eq("Professor of the Decade")
    expect(browser_page_text).to include("Professor of the Decade")
    expect(browser_page_text).to include("Award or Honor")
    $browser.find_element(:link_text, "Professor of the Decade (Faculty, Jane - 2010)")
    $browser.find_element(:css, "a[title=\"name\"]").click
    expect($browser.title).to eq("Professor of the Decade (Faculty, Jane - 2010)")
    expect(browser_page_text).to include("Professor of the Decade (Faculty, Jane - 2010)")
    $browser.find_element(:link_text, "Professor of the Decade").click
    $browser.find_element(:css, "a[title=\"name\"]").click
    expect($browser.title).to eq("Professor of the Decade (Faculty, Jane - 2010)")
    expect($browser.title).to eq("Professor of the Decade (Faculty, Jane - 2010)")
    expect(browser_page_text).to include("Professor of the Decade (Faculty, Jane - 2010)")
    $browser.find_element(:link_text, "Professor of the Decade")
    expect(browser_page_text).to include("Faculty, Jane   Assistant Professor")
    $browser.find_element(:link_text, "Faculty, Jane")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("2000 - 2010")
    expect(browser_page_text).to include("2010")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:link_text, "Primate Expert").click
    expect($browser.title).to eq("Primate Expert")
    expect(browser_page_text).to include("Primate Expert")
    expect(browser_page_text).to include("Award or Honor")
    $browser.find_element(:link_text, "Primate Expert (Faculty, Jane - 2005)")
    $browser.find_element(:link_text, "Primate Expert (Faculty, Jane - 2005)").click
    expect($browser.title).to eq("Primate Expert (Faculty, Jane - 2005)")
    expect(browser_page_text).to include("Primate Expert (Faculty, Jane - 2005)")
    expect(browser_page_text).to include("Yearly award for the person who does the most to improve the life of primates.")
    $browser.find_element(:link_text, "Primate Expert")
    expect(browser_page_text).to include("Faculty, Jane   Assistant Professor")
    $browser.find_element(:link_text, "Faculty, Jane")
    $browser.find_element(:link_text, "Primates-R-Us")
    expect(browser_page_text).to include("2005")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
