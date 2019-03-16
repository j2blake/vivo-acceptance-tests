shared_examples "Add Roles: Add Librarian Roles2" do
  it "Add head of and member of roles for Lily Librarian" do
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

  it "Add Head of role" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:css, "a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Librarian, Lily : Add a new \"head of\" role")
    expect(browser_page_text).to include("Organization Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Department")
    expect(browser_page_text).to include("Organization Name")
    expect(browser_page_text).to include("Role in Organization")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Reference Division")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Head Librarian")
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
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Add Member of role" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[9]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Librarian, Lily : Add a new membership")
    expect(browser_page_text).to include("Membership In")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Association")
    expect(browser_page_text).to include("Organization Name")
    expect(browser_page_text).to include("Role in Organization")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("American Library Association")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Member")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1988")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
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

  it "Verify Head of and Member of roles display" do
    expect(browser_page_text).to include("Reference Division Head Librarian 2009 -")
    $browser.find_element(:link_text, "Reference Division")
    expect(browser_page_text).to include("American Library Association Member 1988 -")
    $browser.find_element(:link_text, "American Library Association")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
