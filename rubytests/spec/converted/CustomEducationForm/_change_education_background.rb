shared_examples "Custom Education Form: Change Education Background" do
  it "Make changes to 3 degrees" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Jane Faculty via Index" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
  end

  it "Verify all 3 degree entries exist" do
    expect($browser.title).to eq("Faculty, Jane")
    expect($browser.find_element(:css, "#RO_0000056-EducationalProcess-List > li").text).to eq("M.Ed. in Business Education, University of Wisconsin , Graduate School Fellowship 2002 -")
    expect($browser.find_element(:xpath, ".//ul[@id='RO_0000056-EducationalProcess-List']/li[2]").text).to eq("M.B.A. in Business Administration, Carroll University , Business Department 1998 - 2000")
    expect($browser.find_element(:xpath, ".//ul[@id='RO_0000056-EducationalProcess-List']/li[3]").text).to eq("B.S. in Business Administration, Carroll College 1980")
  end

  it "Change department, year, and supplemental info for B.S. degree" do
    $browser.find_element(:xpath, "(.//img[@alt='edit this entry'])[5]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "dept").clear
    $browser.find_element(:id, "dept").send_keys("Business Department")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("1981")
    $browser.find_element(:id, "info").clear
    $browser.find_element(:id, "info").send_keys("Four year full scholarship")
    $browser.find_element(:id, "submit").click
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
  end

  it "Verify B.S. degree info changed but other 2 degrees the same" do
    expect($browser.title).to eq("Faculty, Jane")
    expect($browser.find_element(:css, "#RO_0000056-EducationalProcess-List > li").text).to eq("M.Ed. in Business Education, University of Wisconsin , Graduate School Fellowship 2002 -")
    expect($browser.find_element(:xpath, ".//ul[@id='RO_0000056-EducationalProcess-List']/li[2]").text).to eq("M.B.A. in Business Administration, Carroll University , Business Department 1998 - 2000")
    expect($browser.find_element(:xpath, ".//ul[@id='RO_0000056-EducationalProcess-List']/li[3]").text).to eq("B.S. in Business Administration, Carroll College , Business Department, Four year full scholarship 1981")
  end

  it "Change department for M.B.A. degree" do
    $browser.find_element(:xpath, "(.//img[@alt='edit this entry'])[4]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "dept").clear
    $browser.find_element(:id, "dept").send_keys("Business Administration Department")
    $browser.find_element(:id, "submit").click
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
  end

  it "Verify M.B.A. school changed but other 2 degrees the same" do
    expect($browser.title).to eq("Faculty, Jane")
    expect($browser.find_element(:css, "#RO_0000056-EducationalProcess-List > li").text).to eq("M.Ed. in Business Education, University of Wisconsin , Graduate School Fellowship 2002 -")
    expect($browser.find_element(:xpath, ".//ul[@id='RO_0000056-EducationalProcess-List']/li[2]").text).to eq("M.B.A. in Business Administration, Carroll University , Business Administration Department 1998 - 2000")
    expect($browser.find_element(:xpath, ".//ul[@id='RO_0000056-EducationalProcess-List']/li[3]").text).to eq("B.S. in Business Administration, Carroll College , Business Department, Four year full scholarship 1981")
  end

  it "Change M.Ed. to add department and delete supplemental info" do
    $browser.find_element(:css, "a.edit-RO_0000056 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "dept").clear
    $browser.find_element(:id, "dept").send_keys("School of Business")
    $browser.find_element(:id, "info").clear
    $browser.find_element(:id, "info").send_keys("")
    $browser.find_element(:id, "submit").click
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
  end

  it "Verify M.Ed. degree info changed but other 2 degrees the same" do
    expect($browser.title).to eq("Faculty, Jane")
    expect($browser.find_element(:css, "#RO_0000056-EducationalProcess-List > li").text).to eq("M.Ed. in Business Education, University of Wisconsin , School of Business 2002 -")
    expect($browser.find_element(:xpath, ".//ul[@id='RO_0000056-EducationalProcess-List']/li[2]").text).to eq("M.B.A. in Business Administration, Carroll University , Business Administration Department 1998 - 2000")
    expect($browser.find_element(:xpath, ".//ul[@id='RO_0000056-EducationalProcess-List']/li[3]").text).to eq("B.S. in Business Administration, Carroll College , Business Department, Four year full scholarship 1981")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
