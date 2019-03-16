shared_examples "Add Roles: Add Faculty Member Roles1" do
  it "Add grant roles for Jane Faculty--originally tested auto-complete but doesn't work well within Selenium" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Cancel out before adding Co-principal Investigator" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[22]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create co-principal investigator entry for Faculty, Jane")
    expect(browser_page_text).to include("Grant Name")
    expect(browser_page_text).to include("Years of Participation in Grant")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add good Co-principal Investigator role" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[22]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create co-principal investigator entry for Faculty, Jane")
    expect(browser_page_text).to include("Grant Name")
    expect(browser_page_text).to include("Years of Participation in Grant")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "grant").clear
    $browser.find_element(:id, "grant").send_keys("NIH VIVO")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2009")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Navigate back to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify Co-principal Investigator role is showing up" do
    $browser.find_element(:link_text, "NIH VIVO")
    expect(browser_page_text).to include("NIH VIVO 2009 - 2010")
  end

  it "Add second Co-principal Investigator role" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[22]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create co-principal investigator entry for Faculty, Jane")
    expect(browser_page_text).to include("Grant Name")
    expect(browser_page_text).to include("Years of Participation in Grant")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "grant").clear
    $browser.find_element(:id, "grant").send_keys("VIVO Cornell Grant")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2007")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2009")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Navigate back to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify both Co-principal Investigator roles are showing up" do
    $browser.find_element(:link_text, "VIVO Cornell Grant")
    expect(browser_page_text).to include("VIVO Cornell Grant 2007 - 2009")
    $browser.find_element(:link_text, "NIH VIVO")
    expect(browser_page_text).to include("NIH VIVO 2009 - 2010")
  end

  it "Cancel out before adding Investigator" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[23]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create investigator entry for Faculty, Jane")
    expect(browser_page_text).to include("Grant Name")
    expect(browser_page_text).to include("Years of Participation in Grant")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Enter good Investigator role" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[23]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create investigator entry for Faculty, Jane")
    expect(browser_page_text).to include("Grant Name")
    expect(browser_page_text).to include("Years of Participation in Grant")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "grant").clear
    $browser.find_element(:id, "grant").send_keys("VIVO Cornell Grant Too")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2009")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2009")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Navigate back to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify Investigator role is showing up" do
    $browser.find_element(:link_text, "VIVO Cornell Grant Too")
    expect(browser_page_text).to include("VIVO Cornell Grant Too 2009")
  end

  it "Add Principal Investigator role" do
    $browser.find_element(:css, "#researchGroup > article.property > #RO_0000053 > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create principal investigator entry for Faculty, Jane")
    expect(browser_page_text).to include("Grant Name")
    expect(browser_page_text).to include("Years of Participation in Grant")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "grant").clear
    $browser.find_element(:id, "grant").send_keys("NIH VIVO Too")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2010")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Navigate back to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify Principal Investigator role is showing up" do
    $browser.find_element(:link_text, "NIH VIVO Too")
    expect(browser_page_text).to include("NIH VIVO Too 2010 -")
  end

  it "Verify that all grant roles are still there" do
    $browser.find_element(:link_text, "NIH VIVO")
    expect(browser_page_text).to include("NIH VIVO 2009 - 2010")
    $browser.find_element(:link_text, "VIVO Cornell Grant")
    expect(browser_page_text).to include("VIVO Cornell Grant 2007 - 2009")
    $browser.find_element(:link_text, "VIVO Cornell Grant Too")
    expect(browser_page_text).to include("VIVO Cornell Grant Too 2009")
    $browser.find_element(:link_text, "NIH VIVO Too")
    expect(browser_page_text).to include("NIH VIVO Too 2010 -")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
