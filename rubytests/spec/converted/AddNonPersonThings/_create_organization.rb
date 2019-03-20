shared_examples "Add Non Person Things: Create Organization" do
  it "Validate adding Organization" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    expect(browser_page_text).to include("Data Input")
  end

  it "Select to add then cancel right away" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "College (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new College")
    expect(browser_page_text).to include("Name")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Select to add then enter empty field" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "College (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new College")
    expect(browser_page_text).to include("Name")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please enter a value in the Name field.")
  end

  it "Now enter something in the field" do
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate College of America")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
  end

  it "Test overview entry (image and webpage have been tested)" do
    $browser.find_element(:xpath, ".//h2[@id='overview']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("The Primate College of America is a privately-funded college for the study of primates.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "a.add-offers > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "B.S. Bachelor of Science (Academic Degree)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    $browser.find_element(:css, "a.add-hasPredecessorOrganization > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "College (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate College of New York")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:css, "a.add-assigns > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Habitat Research Grant")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:css, "a.add-sponsors > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Student of the Year")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "award").clear
    $browser.find_element(:id, "award").send_keys("Best Primate College")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[14]").click
    $browser.find_element(:css, "a.add-hasEquipment > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Portable Primate Habitat")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:css, "a.add-subcontractsGrant > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Survival Planning Grant")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
  end

  it "Test affiliation entry" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[4]").click
    $browser.find_element(:css, "a.add-BFO_0000051 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Laboratory (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Research Laboratory")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "a.add-BFO_0000051 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Library (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate History Library")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "#relatedBy-Position > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "positionTitle").clear
    $browser.find_element(:id, "positionTitle").send_keys("Dr.")
    browser_find_select_list(:name, "positionType").select_by(:text, "Faculty Administrative Position")
    $browser.find_element(:id, "person").clear
    $browser.find_element(:id, "person").send_keys("Person")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Polly")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1999")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Company")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Primates-r-us")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Founder")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "a.add-affiliatedOrganization > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primates-r-us (Company)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[13]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Consortium")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Primate Colleges of the World")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Member")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2009")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "a.add-hasCollaborator > img.add-individual").click
    expect($browser.title).to eq("Edit")
  end

  it " Reached here " do
    $browser.find_element(:id, "object").send_keys("Primate His")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[14]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Service")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Primate Heart Health")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Founder")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
  end

  it "Test publications entry" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    $browser.find_element(:css, "a.add-publisherOf > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Database (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Info")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "#publicationsGroup > article.property > #RO_0000053 > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Invited Talk")
    $browser.find_element(:id, "presentation").clear
    $browser.find_element(:id, "presentation").send_keys("Primate Health and Fitness")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Organizer")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2008")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Primate College of America")
  end

  it "Test service entry" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[10]").click
    $browser.find_element(:css, "#serviceGroup > article.property > #RO_0000053 > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Event")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Primate Health Check")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Sponsor")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2008")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
  end

  it "Test location entry" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    $browser.find_element(:css, "a.add-RO_0001025 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("northern Afr")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
  end

  it "Test contact entry" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[34]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "emailAddress").clear
    $browser.find_element(:id, "emailAddress").send_keys("info@primates.edu")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "article.property > #ARG_2000028 > a.add-ARG_2000028 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "telephoneNumber").clear
    $browser.find_element(:id, "telephoneNumber").send_keys("555-555-5555")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, "(.//h3[@id='ARG_2000028']/a)[2]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "telephoneNumber").clear
    $browser.find_element(:id, "telephoneNumber").send_keys("555-555-5554")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[35]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "streetAddressOne").clear
    $browser.find_element(:id, "streetAddressOne").send_keys("1234 Northern African Nation")
    $browser.find_element(:id, "city").clear
    $browser.find_element(:id, "city").send_keys("Morocco City")
    $browser.find_element(:id, "postalCode").clear
    $browser.find_element(:id, "postalCode").send_keys("1234567890")
    $browser.find_element(:id, "countryEditMode").clear
    $browser.find_element(:id, "countryEditMode").send_keys("Morocco")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
  end

  it "Test time entry" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:css, "a.add-dateTimeInterval > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1959")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
  end

  it "Test other entry" do
    $browser.find_element(:xpath, ".//h3[@id='abbreviation']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("PCoA")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Gorillas")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
  end

  it "Add additional 1.6 fields" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[14]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Workshop")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("New Primate Students")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2003")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2006")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[15]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Performance")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Primates in the Wild")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1997")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    $browser.find_element(:css, "a.add-featuredIn > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Blog Posting (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Happenings")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "a.add-assigneeFor > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("USA222333444555")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "a.add-translatorOf > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Happenings (Blog Posting)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:css, "#researchGroup > article.property > #RO_0000053 > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "grant").send_keys("primate hab")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "a.add-ERO_0001520 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Human and Ape Brain Comparison")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[10]").click
    $browser.find_element(:css, "a.add-ERO_0000037 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Transport Service (obo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Gorilla Moving Company")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "#serviceGroup > article.property > #offers > a.add-offers > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Introduction to Primates")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    $browser.find_element(:css, "a.add-hasSuccessorOrganization > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "University (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate University of America")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:css, "a.add-governingAuthorityFor > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("primate colleges of the wor")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate College of America")
  end

  it "Verify everything entered is displaying properly" do
  end

  it "Check OVERVIEW tab" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    expect(browser_page_text).to include("PCoA")
    expect(browser_page_text).to include("1959 -")
    $browser.find_element(:link_text, "B.S. Bachelor of Science")
    $browser.find_element(:link_text, "Primate Student of the Year")
    $browser.find_element(:link_text, "Best Primate College")
  end

  it "Check AFFILIATION tab" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    expect(browser_page_text).to include("faculty administrative position")
    $browser.find_element(:link_text, "Person, Polly")
    expect(browser_page_text).to include("Person, Polly, Dr. 1999 -")
    $browser.find_element(:link_text, "Primate History Library")
    $browser.find_element(:link_text, "Primate Research Laboratory")
    $browser.find_element(:link_text, "Primates-r-us")
    expect(browser_page_text).to include("Primates-r-us Founder 2010 -")
    $browser.find_element(:link_text, "Primate History Library")
    $browser.find_element(:link_text, "Primates-r-us")
    $browser.find_element(:link_text, "Primate Colleges of the World")
    expect(browser_page_text).to include("Primate Colleges of the World Member 2009 -")
    $browser.find_element(:link_text, "Primate Heart Health")
    expect(browser_page_text).to include("Primate Heart Health Founder 2010 -")
    $browser.find_element(:link_text, "New Primate Students")
    expect(browser_page_text).to include("New Primate Students 2003 - 2006")
    $browser.find_element(:link_text, "Primates in the Wild")
    expect(browser_page_text).to include("Primates in the Wild 1997 -")
  end

  it "Check PUBLICATIONS tab" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    $browser.find_element(:link_text, "Primate Info")
    expect(browser_page_text).to include("invited talk")
    $browser.find_element(:link_text, "Primate Health and Fitness")
    expect(browser_page_text).to include("Primate Health and Fitness, Organizer 2008")
    $browser.find_element(:link_text, "Primate Happenings")
    $browser.find_element(:link_text, "USA222333444555")
  end

  it "Check RESEARCH tab" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:link_text, "Primate Habitat Research Grant")
    $browser.find_element(:link_text, "Primate Habitat Research Grant")
    $browser.find_element(:link_text, "Primate Survival Planning Grant")
    $browser.find_element(:link_text, "Human and Ape Brain Comparison")
    expect(browser_page_text).to include("Gorillas")
  end

  it "Check SERVICE tab" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[10]").click
    $browser.find_element(:link_text, "Gorilla Moving Company")
    $browser.find_element(:link_text, "Primate Health Check")
    expect(browser_page_text).to include("Primate Health Check Sponsor 2008 - 2010")
    $browser.find_element(:link_text, "Portable Primate Habitat")
    $browser.find_element(:link_text, "Introduction to Primates")
  end

  it "Check CONTACT tab" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    expect(browser_page_text).to include("555-555-5555")
    expect(browser_page_text).to include("555-555-5554")
    expect(browser_page_text).to include("info@primates.edu")
    expect(browser_page_text).to include("1234 Northern African Nation")
    expect(browser_page_text).to include("Morocco City")
    expect(browser_page_text).to include("1234567890")
    expect(browser_page_text).to include("Morocco")
    $browser.find_element(:link_text, "northern Africa")
    $browser.find_element(:link_text, "Primate College of New York")
    $browser.find_element(:link_text, "Primate University of America")
    $browser.find_element(:link_text, "Primate Colleges of the World")
  end

  it "Check VIEW ALL tab" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[14]").click
    expect(browser_page_text).to include("PCoA")
    expect(browser_page_text).to include("1959 -")
    $browser.find_element(:link_text, "B.S. Bachelor of Science")
    $browser.find_element(:link_text, "Primate Student of the Year")
    $browser.find_element(:link_text, "Best Primate College")
    expect(browser_page_text).to include("faculty administrative position")
    $browser.find_element(:link_text, "Person, Polly")
    expect(browser_page_text).to include("Person, Polly, Dr. 1999 -")
    $browser.find_element(:link_text, "Primate History Library")
    $browser.find_element(:link_text, "Primate Research Laboratory")
    $browser.find_element(:link_text, "Primates-r-us")
    expect(browser_page_text).to include("Primates-r-us Founder 2010 -")
    $browser.find_element(:link_text, "Primate History Library")
    $browser.find_element(:link_text, "Primates-r-us")
    $browser.find_element(:link_text, "Primate Colleges of the World")
    expect(browser_page_text).to include("Primate Colleges of the World Member 2009 -")
    $browser.find_element(:link_text, "Primate Heart Health")
    expect(browser_page_text).to include("Primate Heart Health Founder 2010 -")
    $browser.find_element(:link_text, "New Primate Students")
    expect(browser_page_text).to include("New Primate Students 2003 - 2006")
    $browser.find_element(:link_text, "Primates in the Wild")
    expect(browser_page_text).to include("Primates in the Wild 1997 -")
    $browser.find_element(:link_text, "Primate Info")
    expect(browser_page_text).to include("invited talk")
    $browser.find_element(:link_text, "Primate Health and Fitness")
    expect(browser_page_text).to include("Primate Health and Fitness, Organizer 2008")
    $browser.find_element(:link_text, "Primate Happenings")
    $browser.find_element(:link_text, "USA222333444555")
    $browser.find_element(:link_text, "Primate Happenings")
    $browser.find_element(:link_text, "Primate Habitat Research Grant")
    $browser.find_element(:link_text, "Primate Habitat Research Grant")
    $browser.find_element(:link_text, "Primate Survival Planning Grant")
    $browser.find_element(:link_text, "Human and Ape Brain Comparison")
    expect(browser_page_text).to include("Gorillas")
    $browser.find_element(:link_text, "Gorilla Moving Company")
    $browser.find_element(:link_text, "Primate Health Check")
    expect(browser_page_text).to include("Primate Health Check Sponsor 2008 - 2010")
    $browser.find_element(:link_text, "Portable Primate Habitat")
    $browser.find_element(:link_text, "Introduction to Primates")
    expect(browser_page_text).to include("555-555-5555")
    expect(browser_page_text).to include("555-555-5554")
    expect(browser_page_text).to include("info@primates.edu")
    expect(browser_page_text).to include("1234 Northern African Nation")
    expect(browser_page_text).to include("Morocco City")
    expect(browser_page_text).to include("1234567890")
    expect(browser_page_text).to include("Morocco")
    $browser.find_element(:link_text, "northern Africa")
    $browser.find_element(:link_text, "Primate College of New York")
    $browser.find_element(:link_text, "Primate University of America")
    $browser.find_element(:link_text, "Primate Colleges of the World")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
