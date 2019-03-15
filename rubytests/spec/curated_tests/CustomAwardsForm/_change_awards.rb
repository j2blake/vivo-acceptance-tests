shared_examples "Custom Awards Form: Change Awards" do
  it "Change 3 existing awards" do
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

  it "Verify position to be changed exisit" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
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

  it "Correct the date of the Best Professor award" do
    $browser.find_element(:css, "a.edit-relatedBy > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "yearAwardedDisplay").clear
    $browser.find_element(:id, "yearAwardedDisplay").send_keys("2002")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify awards are still listed correctly" do
    expect(browser_page_text).to include("Best Professor, conferred by Carroll College, 2002")
    $browser.find_element(:link_text, "Best Professor")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Professor of the Decade, conferred by Carroll College, 2010")
    $browser.find_element(:link_text, "Professor of the Decade")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Primate Expert, conferred by Primates-R-Us, 2005")
    $browser.find_element(:link_text, "Primate Expert")
    $browser.find_element(:link_text, "Primates-R-Us")
  end

  it "Remove year but add year range to Primate Expert award" do
    $browser.find_element(:xpath, "(.//img[@alt='edit this entry'])[4]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "yearAwardedDisplay").clear
    $browser.find_element(:id, "yearAwardedDisplay").send_keys("")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2004")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2005")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify awards are still listed correctly" do
    expect(browser_page_text).to include("Best Professor, conferred by Carroll College, 2002")
    $browser.find_element(:link_text, "Best Professor")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Professor of the Decade, conferred by Carroll College, 2010")
    $browser.find_element(:link_text, "Professor of the Decade")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Primate Expert, conferred by Primates-R-Us, 2004 - 2005")
    $browser.find_element(:link_text, "Primate Expert")
    $browser.find_element(:link_text, "Primates-R-Us")
  end

  it "Remove the year for the Professor of the Decade award" do
    $browser.find_element(:css, "a.edit-relatedBy > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "yearAwardedDisplay").clear
    $browser.find_element(:id, "yearAwardedDisplay").send_keys("")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify awards are still listed correctly" do
    expect(browser_page_text).to include("Best Professor, conferred by Carroll College, 2002")
    $browser.find_element(:link_text, "Best Professor")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Professor of the Decade, conferred by Carroll College")
    $browser.find_element(:link_text, "Professor of the Decade")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Primate Expert, conferred by Primates-R-Us, 2004 - 2005")
    $browser.find_element(:link_text, "Primate Expert")
    $browser.find_element(:link_text, "Primates-R-Us")
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
  end

  it "Verify positions are still listed correctly" do
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Best Professor, conferred by Carroll College, 2002")
    expect(browser_page_text).to include("Primate Expert, conferred by Primates-R-Us, 2004 - 2005")
    expect(browser_page_text).to include("Professor of the Decade, conferred by Carroll College")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
