shared_examples "Add Roles: Add Faculty Member Roles2" do
  it "Add activities roles for Jane Faculty" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
  end

  it "Navigate to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Cancel out before adding research activity" do
    $browser.find_element(:css, "#RO_0000053-ResearcherRole > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Faculty, Jane : Add a new researcher role")
    expect(browser_page_text).to include("Research Activity Type")
    expect(browser_page_text).to include("Research Activity Name")
    expect(browser_page_text).to include("Role in Research Activity")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Cancel out after selecting research activity type" do
    $browser.find_element(:css, "#RO_0000053-ResearcherRole > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Faculty, Jane : Add a new researcher role")
    expect(browser_page_text).to include("Research Activity Type")
    expect(browser_page_text).to include("Research Activity Name")
    expect(browser_page_text).to include("Role in Research Activity")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Project")
    expect(browser_page_text).to include("Faculty, Jane : Add a new researcher role")
    expect(browser_page_text).to include("Research Activity Type")
    expect(browser_page_text).to include("Research Activity Name")
    expect(browser_page_text).to include("Role in Research Activity")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:link_text, "Cancel").click
  end

  it "Enter research activity without start year" do
    $browser.find_element(:css, "#RO_0000053-ResearcherRole > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Project")
    expect(browser_page_text).to include("Faculty, Jane : Add a new researcher role")
    expect(browser_page_text).to include("Research Activity Type")
    expect(browser_page_text).to include("Research Activity Name")
    expect(browser_page_text).to include("Role in Research Activity")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("History of Apes in Africa")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Consultant")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2010")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
    $browser.find_element(:id, "submit").click
  end

  it "Navigate back to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add research activity - grant" do
    $browser.find_element(:css, "#RO_0000053-ResearcherRole > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Faculty, Jane : Add a new researcher role")
    expect(browser_page_text).to include("Research Activity Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Grant")
    expect(browser_page_text).to include("Faculty, Jane : Add a new researcher role")
    expect(browser_page_text).to include("Research Activity Type")
    expect(browser_page_text).to include("Research Activity Name")
    expect(browser_page_text).to include("Role in Research Activity")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Habitats for Apes")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Researcher")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1980")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("1985")
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

  it "Add teaching activity - conference" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:css, "#teachingGroup > article.property > #RO_0000053 > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Faculty, Jane : Add a new teaching role")
    expect(browser_page_text).to include("Teaching Activity Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Conference")
    expect(browser_page_text).to include("Teaching Activity Name")
    expect(browser_page_text).to include("Role in Teaching Activity")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Ape World")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Planner")
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

  it "Add teaching activity - course" do
    $browser.find_element(:css, "#teachingGroup > article.property > #RO_0000053 > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Course")
    expect(browser_page_text).to include("Faculty, Jane : Add a new teaching role")
    expect(browser_page_text).to include("Teaching Activity Type")
    expect(browser_page_text).to include("Teaching Activity Name")
    expect(browser_page_text).to include("Role in Teaching Activity")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Introduction to the Ape World")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Creator")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2000")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2001")
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

  it "Add teaching activity - workshop" do
    $browser.find_element(:css, "#teachingGroup > article.property > #RO_0000053 > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Workshop")
    expect(browser_page_text).to include("Faculty, Jane : Add a new teaching role")
    expect(browser_page_text).to include("Teaching Activity Type")
    expect(browser_page_text).to include("Teaching Activity Name")
    expect(browser_page_text).to include("Role in Teaching Activity")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Working with Primates")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Co-Instructor")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2000")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2005")
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

  it "Add clinical activity - project" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[11]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Faculty, Jane : Add a new clinical activity")
    expect(browser_page_text).to include("Clinical Activity Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Project")
    expect(browser_page_text).to include("Faculty, Jane : Add a new clinical activity")
    expect(browser_page_text).to include("Clinical Activity Type")
    expect(browser_page_text).to include("Clinical Activity Name")
    expect(browser_page_text).to include("Role in Clinical Activity")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Prototype New Ape Home")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Designer")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1990")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("1991")
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

  it "Add clinical activity - service" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[11]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Faculty, Jane : Add a new clinical activity")
    expect(browser_page_text).to include("Clinical Activity Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Service")
    expect(browser_page_text).to include("Faculty, Jane : Add a new clinical activity")
    expect(browser_page_text).to include("Clinical Activity Type")
    expect(browser_page_text).to include("Clinical Activity Name")
    expect(browser_page_text).to include("Role in Clinical Activity")
    expect(browser_page_text).to include("Years of Participation")
    expect(browser_page_text).to include("Start Year")
    expect(browser_page_text).to include("End Year")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Ape Health Program")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Founder")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1993")
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

  it "Verify activities displayed for Jane Faculty" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
    browser_wait_for_jQuery
    $browser.find_element(:link_text, "Prototype New Ape Home")
    expect(browser_page_text).to include("Prototype New Ape Home Designer 1990 - 1991")
    $browser.find_element(:link_text, "Ape Health Program")
    expect(browser_page_text).to include("Ape Health Program Founder 1993 -")
    $browser.find_element(:link_text, "History of Apes in Africa")
    expect(browser_page_text).to include("History of Apes in Africa Consultant 2010 -")
    $browser.find_element(:link_text, "Habitats for Apes")
    expect(browser_page_text).to include("Habitats for Apes Researcher 1980 - 1985")
    $browser.find_element(:link_text, "Working with Primates")
    expect(browser_page_text).to include("Working with Primates Co-Instructor 2000 - 2005")
    $browser.find_element(:link_text, "Introduction to the Ape World")
    expect(browser_page_text).to include("Introduction to the Ape World Creator 2000 - 2001")
    $browser.find_element(:link_text, "Ape World")
    expect(browser_page_text).to include("Ape World Planner 2009")
  end

  it "Verify front page display" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "View all ...").click
    expect($browser.title).to eq("Research")
    browser_wait_for_jQuery
    $browser.find_element(:link_text, "Grant (5)")
    $browser.find_element(:link_text, "Habitats for Apes")
    $browser.find_element(:link_text, "NIH VIVO")
    $browser.find_element(:link_text, "NIH VIVO Too")
    $browser.find_element(:link_text, "VIVO Cornell Grant")
    $browser.find_element(:link_text, "VIVO Cornell Grant Too")
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    browser_wait_for_jQuery
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor")
    $browser.find_element(:css, "a[alt=\"view all faculty\"]").click
    browser_wait_for_jQuery
    expect($browser.title).to eq("People")
    $browser.find_element(:link_text, "Faculty Member (1)")
    $browser.find_element(:link_text, "Librarian (1)")
    $browser.find_element(:link_text, "Person (2)")
    $browser.find_element(:link_text, "Faculty Member (1)").click
    browser_wait_for_jQuery
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor")
    $browser.find_element(:link_text, "Librarian (1)").click
    browser_wait_for_jQuery
    $browser.find_element(:link_text, "Librarian, Lily")
    expect(browser_page_text).to include("Associate Librarian")
    $browser.find_element(:link_text, "Person (2)").click
    browser_wait_for_jQuery
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor")
    $browser.find_element(:link_text, "Librarian, Lily")
    expect(browser_page_text).to include("Associate Librarian")
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:css, "p.stats-count")
    $browser.find_element(:xpath, ".//ul[@id='stats']/li[2]/a/p")
    $browser.find_element(:xpath, ".//ul[@id='stats']/li[3]/a/p")
    $browser.find_element(:xpath, ".//ul[@id='stats']/li[4]/a/p")
    $browser.find_element(:xpath, ".//ul[@id='stats']/li[5]/a/p")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
