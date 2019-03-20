shared_examples "Custom Education Form: Add Education Background" do
  it "Validate Educational Background Form" do
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
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    $browser.find_element(:css, "a.add-RO_0000056 > img.add-individual").click
    expect($browser.title).to eq("Edit")
  end

  it "Cancel out of form" do
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-RO_0000056 > img.add-individual").click
    expect($browser.title).to eq("Edit")
  end

  it "Verify entering no fields results in error" do
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please select a value in the Organization Type field.")
    expect(browser_page_text).to include("Please select a value in the Type of Educational Training field.")
  end

  it "Verify entering just organization type" do
    browser_find_select_list(:id, "typeSelector").select_by(:text, "College")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please select a value in the Type of Educational Training field.")
  end

  it "Verify entering just the org type and college name" do
    browser_find_select_list(:id, "typeSelector").select_by(:text, "College")
    $browser.find_element(:id, "relatedIndLabel").clear
    $browser.find_element(:id, "relatedIndLabel").send_keys("Carroll College")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please select a value in the Type of Educational Training field.")
  end

  it "Verify entering everything" do
    browser_find_select_list(:id, "typeSelector").select_by(:text, "College")
    $browser.find_element(:id, "relatedIndLabel").clear
    $browser.find_element(:id, "relatedIndLabel").send_keys("Carroll College")
    browser_find_select_list(:name, "trainingType").select_by(:text, "Academic Studies or Other Training")
    browser_find_select_list(:id, "degreeUri").select_by(:text, "B.S. Bachelor of Science")
    $browser.find_element(:id, "majorField").clear
    $browser.find_element(:id, "majorField").send_keys("Business Administration")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("1980")
    vivo_click_and_wait_for_indexing(:id, "submit")
  end

  it "Verify degree appears" do
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("B.S. in Business Administration, Carroll College 1980")
    $browser.find_element(:link_text, "Carroll College")
  end

  it "Add degree from another new organization" do
    $browser.find_element(:css, "a.add-RO_0000056 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "University")
    $browser.find_element(:id, "relatedIndLabel").clear
    $browser.find_element(:id, "relatedIndLabel").send_keys("Carroll University")
    browser_find_select_list(:name, "trainingType").select_by(:text, "Academic Studies or Other Training")
    $browser.find_element(:id, "dept").clear
    $browser.find_element(:id, "dept").send_keys("Business Department")
    browser_find_select_list(:id, "degreeUri").select_by(:text, "M.B.A. Master of Business Administration")
    $browser.find_element(:id, "majorField").clear
    $browser.find_element(:id, "majorField").send_keys("Business Administration")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1998")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2000")
    $browser.find_element(:id, "submit").click
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
  end

  it "Verify both degrees appear" do
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("B.S. in Business Administration, Carroll College 1980")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("M.B.A. in Business Administration, Carroll University , Business Department 1998 - 2000")
    $browser.find_element(:link_text, "Carroll University")
  end

  it "Add third degree from new organization" do
    $browser.find_element(:css, "a.add-RO_0000056 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "University")
    $browser.find_element(:id, "relatedIndLabel").clear
    $browser.find_element(:id, "relatedIndLabel").send_keys("University of Wisconsin")
    browser_find_select_list(:name, "trainingType").select_by(:text, "Academic Studies or Other Training")
    browser_find_select_list(:id, "degreeUri").select_by(:text, "M.Ed. Master of Education")
    $browser.find_element(:id, "majorField").clear
    $browser.find_element(:id, "majorField").send_keys("Business Education")
    $browser.find_element(:id, "info").clear
    $browser.find_element(:id, "info").send_keys("Graduate School Fellowship")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2002")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
    $browser.find_element(:id, "submit").click
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
  end

  it "Verify all 3 degress show up" do
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("B.S. in Business Administration, Carroll College 1980")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("M.B.A. in Business Administration, Carroll University , Business Department 1998 - 2000")
    $browser.find_element(:link_text, "Carroll University")
    expect(browser_page_text).to include("M.Ed. in Business Education, University of Wisconsin , Graduate School Fellowship 2002 -")
    $browser.find_element(:link_text, "University of Wisconsin")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
