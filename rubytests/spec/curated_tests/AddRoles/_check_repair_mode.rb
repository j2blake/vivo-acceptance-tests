shared_examples "Add Roles: Check Repair Mode" do
  it "Test repair mode using Lily Librarian--originally tested auto-complete but doesn't work well within Selenium" do
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

  it "Create a membership role in the front end" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[9]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Association")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("LITA")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Member at Large")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1999")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2009")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Verify membership role" do
    $browser.find_element(:link_text, "LITA")
    expect(browser_page_text).to include("Member at Large 1999 - 2009")
    $browser.find_element(:link_text, "LITA").click
    expect($browser.title).to eq("LITA")
    $browser.find_element(:css, "li.selectedGroupTab.clickable").click
    $browser.find_element(:link_text, "Librarian, Lily")
    expect(browser_page_text).to include("Member at Large")
    expect(browser_page_text).to include("1999 - 2009")
  end

  it "Go to role node in backend editing" do
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
    $browser.find_element(:link_text, "LITA").click
    expect($browser.title).to eq("LITA")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Verify role is there" do
    expect(browser_page_text).to include("LITA")
    $browser.find_element(:link_text, "contributor")
    $browser.find_element(:link_text, "Member at Large")
  end

  it "Delete relationship between role node and non-person thing" do
    $browser.find_element(:xpath, ".//input[@value='Delete']").click
    browser_accept_alert("Are you sure you want to delete the property Member at Large contributor?")
  end

  it "Verify role is gone" do
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    expect(browser_page_text).to include("LITA")
    expect($browser.find_elements(:link_text, "related role").size).to eq(0)
    expect($browser.find_elements(:link_text, "Member at Large").size).to eq(0)
  end

  it "Go back to Lily Librarian in front end" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Verify condition of MEMBER OF" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
    expect(browser_page_text).to include("missing activity Member at Large 1999 - 2009")
    $browser.find_element(:link_text, "missing activity")
  end

  it "Edit MEMBER OF to add data back" do
    $browser.find_element(:xpath, "(.//img[@alt='edit this entry'])[5]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Librarian, Lily : Edit this membership")
    expect(browser_page_text).to include("Membership In")
  end

  it "Don't select anything--just press enter button" do
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please select a type from the drop-down list.")
    expect(browser_page_text).to include("Please select an existing value or enter a new value in the Name field.")
  end

  it "Have to re-select Association" do
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Association")
    expect(browser_page_text).to include("Librarian, Lily : Edit this membership")
    expect(browser_page_text).to include("Membership In")
    expect(browser_page_text).to include("Organization Name")
    expect(browser_page_text).to include("Role in Organization")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
  end

  it "Forgot to enter name of organization so error occurred" do
    expect(browser_page_text).to include("Please select an existing value or enter a new value in the Name field.")
  end

  it "Now enter the missing information" do
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("LITA Too")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Member at Large")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1999")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2009")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Librarian, Lily")
    expect(browser_page_text).to include("Member at Large 1999 - 2009")
    $browser.find_element(:link_text, "LITA Too")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
