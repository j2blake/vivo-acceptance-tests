shared_examples "Add Roles: Add Librarian Roles1" do
  it "Add 3 roles for Lily Librarian" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Lily Librarian" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Start to add presentation and cancel out" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[16]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create presentation entry for Librarian, Lily")
    expect(browser_page_text).to include("Presentation Type")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Select presentation type then cancel out" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[16]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Presentation")
    expect(browser_page_text).to include("Create presentation entry for Librarian, Lily")
    expect(browser_page_text).to include("Presentation Type")
    expect(browser_page_text).to include("Title of Presentation")
    expect(browser_page_text).to include("Role in Presentation")
    expect(browser_page_text).to include("Presented At")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:link_text, "Cancel").click
  end

  it "Start to add presentation again, but enter no required field" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[16]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create presentation entry for Librarian, Lily")
    expect(browser_page_text).to include("Presentation Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Presentation")
    expect(browser_page_text).to include("Title of Presentation")
    expect(browser_page_text).to include("Role in Presentation")
    expect(browser_page_text).to include("Presented At")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please select an existing value or enter a new value in the Name field.")
  end

  it "Add presentation correctly" do
    expect(browser_page_text).to include("Create presentation entry for Librarian, Lily")
    expect(browser_page_text).to include("Presentation Type")
    expect(browser_page_text).to include("Title of Presentation")
    expect(browser_page_text).to include("Role in Presentation")
    expect(browser_page_text).to include("Presented At")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "presentation").clear
    $browser.find_element(:id, "presentation").send_keys("Researching Primates")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Presenter")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2009")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Navigate back to Lily Librarian" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Add presentation type of invited talk" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[16]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create presentation entry for Librarian, Lily")
    expect(browser_page_text).to include("Presentation Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Invited Talk")
    expect(browser_page_text).to include("Create presentation entry for Librarian, Lily")
    expect(browser_page_text).to include("Presentation Type")
    expect(browser_page_text).to include("Title of Presentation")
    expect(browser_page_text).to include("Role in Presentation")
    expect(browser_page_text).to include("Presented At")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "presentation").clear
    $browser.find_element(:id, "presentation").send_keys("Animal Librarianship")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Member of panel")
    $browser.find_element(:id, "conference").clear
    $browser.find_element(:id, "conference").send_keys("USAIN Conference")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2003")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Navigate back to Lily Librarian" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Verify presentations display" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
    browser_wait_for_jQuery
    #>>>  Seems like "invited talk" isn't displayed.
    #>>>  #<tr><td>verifyTextPresent</td><td>invited talk</td><td></td></tr>
    expect(browser_page_text).to include("Animal Librarianship, Member of panel, USAIN Conference 2003")
    $browser.find_element(:link_text, "Animal Librarianship")
    expect(browser_page_text).to include("presentation")
    expect(browser_page_text).to include("Researching Primates, Presenter 2009")
    $browser.find_element(:link_text, "Researching Primates")
  end

  it "Add service to the profession - college" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[33]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Librarian, Lily : Add a new service provider role")
    expect(browser_page_text).to include("Service To The Profession In")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "College")
    expect(browser_page_text).to include("Organization Name")
    expect(browser_page_text).to include("Role in Organization")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Carroll College")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Consultant")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2010")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Navigate back to Lily Librarian" do
    $browser.find_element(:link_text, "Index").click
    browser_wait_for_jQuery
    $browser.find_element(:link_text, "Librarian").click
    browser_wait_for_jQuery
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Add service to the profession - college" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[33]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Librarian, Lily : Add a new service provider role")
    expect(browser_page_text).to include("Service To The Profession In")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Museum")
    browser_wait_for_jQuery
    expect(browser_page_text).to include("Organization Name")
    expect(browser_page_text).to include("Role in Organization")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Primates of the World")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Board")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2001")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2003")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Navigate back to Lily Librarian" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Librarian").click
    browser_wait_for_jQuery
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Verify that service to the profession displays" do
    expect(browser_page_text).to include("Carroll College Consultant 2010 -")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Primates of the World Board 2001 - 2003")
    $browser.find_element(:link_text, "Primates of the World")
  end

  it "Add outreach and community service - committee" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[34]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Librarian, Lily : Add a new outreach provider role")
    expect(browser_page_text).to include("Outreach & Community Service In")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Committee")
    browser_wait_for_jQuery
    expect(browser_page_text).to include("Organization Name")
    expect(browser_page_text).to include("Role in Organization")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Librarians for the Better Treatment of Primates")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Chair")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2009")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Navigate back to Lily Librarian" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Librarian").click
    browser_wait_for_jQuery
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Add outreach and community service - event" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[34]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Librarian, Lily : Add a new outreach provider role")
    expect(browser_page_text).to include("Outreach & Community Service In")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Association")
    browser_wait_for_jQuery
    expect(browser_page_text).to include("Organization Name")
    expect(browser_page_text).to include("Role in Organization")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Show Me the Primates!")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Booth")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2001")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2001")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Navigate back to Lily Librarian" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Verify outreach and community service display" do
    expect(browser_page_text).to include("Librarians for the Better Treatment of Primates Chair 2009 -")
    $browser.find_element(:link_text, "Librarians for the Better Treatment of Primates")
    expect(browser_page_text).to include("Show Me the Primates! Booth 2001")
    $browser.find_element(:link_text, "Show Me the Primates!")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
