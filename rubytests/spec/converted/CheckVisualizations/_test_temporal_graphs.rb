shared_examples "Check Visualizations: Test Temporal Graphs" do
  it "Add a faculty member for test purposes" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Select to add an Organization" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Department (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Child Development")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Child Development")
  end

  it "Add people to department" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:css, "#relatedBy-Position > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create position history entry for Child Development")
    $browser.find_element(:id, "positionTitle").clear
    $browser.find_element(:id, "positionTitle").send_keys("Dr.")
    browser_find_select_list(:name, "positionType").select_by(:text, "Faculty Position")
    $browser.find_element(:id, "person").send_keys("Furter")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Child Development")
    $browser.find_element(:css, "#relatedBy-Position > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create position history entry for Child Development")
    $browser.find_element(:id, "positionTitle").clear
    $browser.find_element(:id, "positionTitle").send_keys("Ms.")
    browser_find_select_list(:name, "positionType").select_by(:text, "Faculty Position")
    $browser.find_element(:id, "person").send_keys("John")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2011")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Child Development")
    $browser.find_element(:css, "#relatedBy-Position > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create position history entry for Child Development")
    $browser.find_element(:id, "positionTitle").clear
    $browser.find_element(:id, "positionTitle").send_keys("Dr.")
    browser_find_select_list(:name, "positionType").select_by(:text, "Faculty Position")
    $browser.find_element(:id, "person").send_keys("Smith")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2008")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Child Development")
    $browser.find_element(:css, "#relatedBy-Position > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create position history entry for Child Development")
    $browser.find_element(:id, "positionTitle").clear
    $browser.find_element(:id, "positionTitle").send_keys("Mrs.")
    browser_find_select_list(:name, "positionType").select_by(:text, "Faculty Position")
    $browser.find_element(:id, "person").send_keys("Zink")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2007")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Child Development")
  end

  it "Verify all people are correct" do
    expect(browser_page_text).to include("Furter, Frank , Dr. 2010 -")
    expect(browser_page_text).to include("Johnson, Jane, Ms. 2011 -")
    expect(browser_page_text).to include("Smith, Sally, Dr. 2008 -")
    expect(browser_page_text).to include("Zink, Zoe, Mrs. 2007 -")
  end

  it "Refresh visualization cache" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Rebuild visualization cache").click
    expect($browser.title).to eq("Visualization Tools")
    $browser.find_element(:link_text, "Refresh Cached Models for Visualization").click
    expect($browser.title).to eq("Regenerate Constructed Models")
    $browser.find_element(:link_text, "Organizations").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("Organizations")
    $browser.find_element(:link_text, "Child Development").click
    expect($browser.title).to eq("Child Development")
  end

  it "Check out temporal graphs for dept pubs" do
    $browser.find_element(:link_text, "Organizations").click
    expect($browser.title).to eq("Organizations")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Child Development").click
    expect($browser.title).to eq("Child Development")
    $browser.find_element(:link_text, "Temporal Graph").click
    expect($browser.title).to eq("Child Development - Temporal Graph Visualization")
    expect(browser_page_text).to include("Child Development")
    $browser.find_element(:id, "organizationMoniker")
    expect(browser_page_text).to include("How do you want to compare?")
    expect(browser_page_text).to include("What do you want to compare?")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Furter, Frank")
    expect(browser_page_text).to include("4")
    expect(browser_page_text).to include("Johnson, Jane")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("Smith, Sally")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("Zink, Zoe")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("Comparing publications of People in Child Development")
    expect(browser_page_text).to include("2002")
    expect(browser_page_text).to include("2004")
    expect(browser_page_text).to include("2006")
    expect(browser_page_text).to include("2008")
    expect(browser_page_text).to include("2010")
    expect(browser_page_text).to include("2012")
    expect(browser_page_text).to include("Total Number of publications")
    expect(browser_page_text).to include("You have selected 3 of a maximum 10 people.")
    $browser.find_element(:link_text, "Furter, Frank")
    $browser.find_element(:link_text, "Johnson, Jane")
    $browser.find_element(:link_text, "Smith, Sally")
  end

  it "Clear visualization cache" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Rebuild visualization cache").click
    expect($browser.title).to eq("Visualization Tools")
    $browser.find_element(:link_text, "Refresh Cached Models for Visualization").click
    expect($browser.title).to eq("Regenerate Constructed Models")
  end

  it "Check out temporal graphs for dept grants" do
    $browser.find_element(:link_text, "Organizations").click
    expect($browser.title).to eq("Organizations")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Child Development").click
    expect($browser.title).to eq("Child Development")
    $browser.find_element(:link_text, "Temporal Graph").click
    expect($browser.title).to eq("Child Development - Temporal Graph Visualization")
    browser_find_select_list(:xpath, ".//div[@id='leftUpper']/div/select").select_by(:text, "by Grants")
    expect($browser.title).to eq("Child Development - Temporal Graph Visualization")
    expect(browser_page_text).to include("Child Development")
    expect(browser_page_text).to include("How do you want to compare?")
    expect(browser_page_text).to include("What do you want to compare?")
    expect(browser_page_text).to include("Furter, Frank")
    expect(browser_page_text).to include("4")
    expect(browser_page_text).to include("Faculty Member")
    expect(browser_page_text).to include("Zink, Zoe")
    expect(browser_page_text).to include("2")
    expect(browser_page_text).to include("Johnson, Jane")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("Smith, Sally")
    expect(browser_page_text).to include("0")
    expect(browser_page_text).to include("Comparing grants of People in Child Development")
    expect(browser_page_text).to include("2002")
    expect(browser_page_text).to include("2004")
    expect(browser_page_text).to include("2006")
    expect(browser_page_text).to include("2008")
    expect(browser_page_text).to include("2010")
    expect(browser_page_text).to include("2012")
    expect(browser_page_text).to include("2014")
    expect(browser_page_text).to include("Total Number of grants")
    expect(browser_page_text).to include("You have selected 3 of a maximum 10 people.")
    $browser.find_element(:link_text, "Furter, Frank")
    $browser.find_element(:link_text, "Zink, Zoe")
    $browser.find_element(:link_text, "Johnson, Jane")
  end

  it "Make dept sub-org of a college" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    $browser.find_element(:link_text, "Site Admin").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("VIVO Site Administration")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "College (vivo)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("College of Human Ecology")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("College of Human Ecology")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[14]").click
    $browser.find_element(:css, "a.add-BFO_0000051 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Child Development (Department)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("College of Human Ecology")
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:link_text, "Child Development")
  end

  it "Clear visualization cache" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Rebuild visualization cache").click
    expect($browser.title).to eq("Visualization Tools")
    $browser.find_element(:link_text, "Refresh Cached Models for Visualization").click
    expect($browser.title).to eq("Regenerate Constructed Models")
  end

  it "Check out temporal graphs for college pubs" do
    $browser.find_element(:link_text, "Organizations").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("Organizations")
    $browser.find_element(:link_text, "College of Human Ecology").click
    expect($browser.title).to eq("College of Human Ecology")
    $browser.find_element(:link_text, "Temporal Graph").click
    expect($browser.title).to eq("College of Human Ecology - Temporal Graph Visualization")
    $browser.find_element(:id, "organizationMoniker")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("College of Human Ecology")
    expect(browser_page_text).to include("How do you want to compare?")
    expect(browser_page_text).to include("What do you want to compare?")
    expect(browser_page_text).to include("Child Development")
    expect(browser_page_text).to include("4")
    expect(browser_page_text).to include("Department")
    expect(browser_page_text).to include("Comparing publications of Organizations in College of Human Ecology")
    expect(browser_page_text).to include("2002")
    expect(browser_page_text).to include("2004")
    expect(browser_page_text).to include("2006")
    expect(browser_page_text).to include("2008")
    expect(browser_page_text).to include("2010")
    expect(browser_page_text).to include("2012")
    expect(browser_page_text).to include("2014")
    expect(browser_page_text).to include("Total Number of publications")
    expect(browser_page_text).to include("You have selected 1 of a maximum 10 organizations.")
    $browser.find_element(:link_text, "Child Development")
  end

  it "Clear visualization cache" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Rebuild visualization cache").click
    expect($browser.title).to eq("Visualization Tools")
    $browser.find_element(:link_text, "Refresh Cached Models for Visualization").click
    expect($browser.title).to eq("Regenerate Constructed Models")
  end

  it "Check out temporal graphs for college grants" do
    $browser.find_element(:link_text, "Organizations").click
    expect($browser.title).to eq("Organizations")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "College of Human Ecology").click
    expect($browser.title).to eq("College of Human Ecology")
    $browser.find_element(:link_text, "Temporal Graph").click
    expect($browser.title).to eq("College of Human Ecology - Temporal Graph Visualization")
    expect(browser_page_text).to include("College of Human Ecology")
    $browser.find_element(:id, "organizationMoniker")
    browser_find_select_list(:xpath, ".//div[@id='leftUpper']/div/select").select_by(:text, "by Grants")
    expect($browser.title).to eq("College of Human Ecology - Temporal Graph Visualization")
    expect(browser_page_text).to include("College of Human Ecology")
    expect(browser_page_text).to include("How do you want to compare?")
    expect(browser_page_text).to include("What do you want to compare?")
    expect(browser_page_text).to include("Records 1 - 1 of 1")
    expect(browser_page_text).to include("Child Development")
    expect(browser_page_text).to include("4")
    expect(browser_page_text).to include("Department")
    expect(browser_page_text).to include("Comparing grants of Organizations in College of Human Ecology")
    expect(browser_page_text).to include("2002")
    expect(browser_page_text).to include("2004")
    expect(browser_page_text).to include("2006")
    expect(browser_page_text).to include("2008")
    expect(browser_page_text).to include("2010")
    expect(browser_page_text).to include("2012")
    expect(browser_page_text).to include("2014")
    expect(browser_page_text).to include("Total Number of grants")
    expect(browser_page_text).to include("You have selected 1 of a maximum 10 organizations.")
    $browser.find_element(:link_text, "Child Development")
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
