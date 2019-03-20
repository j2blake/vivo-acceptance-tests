shared_examples "Custom Positions Form: Change Positions" do
  it "Change 3 existing positions" do
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
    expect(browser_page_text).to include("Lecturer, Carroll College 1971 -")
    expect(browser_page_text).to include("Assistant Professor, Cornell University 1986 - 2010")
    expect(browser_page_text).to include("Assistant Professor, Carroll University 1981 - 1985")
    $browser.find_element(:link_text, "Carroll College")
    $browser.find_element(:link_text, "Cornell University")
    $browser.find_element(:link_text, "Carroll University")
  end

  it "Correct the dates of the Carroll College position" do
    $browser.find_element(:css, "a.edit-relatedBy > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1977")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("1981")
    $browser.find_element(:id, "submit").click
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
  end

  it "Verify positions are still listed correctly" do
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor, Cornell University 1986 - 2010")
    expect(browser_page_text).to include("Assistant Professor, Carroll University 1981 - 1985")
    expect(browser_page_text).to include("Lecturer, Carroll College 1977 - 1981")
  end

  it "Change the title for Carroll University position" do
    $browser.find_element(:xpath, "(.//img[@alt='edit this entry'])[4]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "positionTitle").clear
    $browser.find_element(:id, "positionTitle").send_keys("Associate Professor")
    $browser.find_element(:id, "submit").click
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
  end

  it "Verify positions are still listed correctly" do
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor, Cornell University 1986 - 2010")
    expect(browser_page_text).to include("Associate Professor, Carroll University 1981 - 1985")
    expect(browser_page_text).to include("Lecturer, Carroll College 1977 - 1981")
  end

  it "Change the title for Cornell University position" do
    $browser.find_element(:css, "a.edit-relatedBy > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "positionTitle").clear
    $browser.find_element(:id, "positionTitle").send_keys("Professor")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
    $browser.find_element(:id, "submit").click
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
  end

  it "Verify positions are still listed correctly" do
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Professor, Cornell University 1986 -")
    expect(browser_page_text).to include("Associate Professor, Carroll University 1981 - 1985")
    expect(browser_page_text).to include("Lecturer, Carroll College 1977 - 1981")
    $browser.find_element(:link_text, "Cornell University")
    $browser.find_element(:link_text, "Carroll University")
    $browser.find_element(:link_text, "Carroll College")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
