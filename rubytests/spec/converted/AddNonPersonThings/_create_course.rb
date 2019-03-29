shared_examples "Add Non Person Things: Create Course" do
  it "Validate adding Course" do
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
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Course (vivo)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Course")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Select to add then enter empty field" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Course (vivo)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Course")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please enter a value in the Name field.")
  end

  it "Now enter something in the field" do
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Introduction to Primate Health")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
  end

  it "Test overview tab entry (image and webpage have been tested)" do
    vivo_select_tab_on_profile('overview')
    $browser.find_element(:xpath, ".//h3[@id='description']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: description")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Learn the basics about the general health of primates.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:css, "a.add-offeredBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:xpath, ".//h3[@id='prerequisiteFor']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:xpath, ".//h3[@id='geographicFocus']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("Afri")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:xpath, ".//h3[@id='dateTimeInterval']/a").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create date time value for Introduction to Primate Health")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2007")
    browser_find_select_list(:id, "startField-month").select_by(:text, "9")
    browser_find_select_list(:id, "startField-day").select_by(:text, "1")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2007")
    browser_find_select_list(:id, "endField-month").select_by(:text, "12")
    browser_find_select_list(:id, "endField-day").select_by(:text, "15")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:css, "a.add-BFO_0000051 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Health Check (Event)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:xpath, ".//h3[@id='hasSubjectArea']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:link_text, "Select or create a VIVO-defined concept.").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "relatedIndLabel").clear
    $browser.find_element(:id, "relatedIndLabel").send_keys("Animal Health")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:css, "a.add-BFO_0000050 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Health and Fitness (Invited Talk)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[7]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Seminar Series (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Health Talks")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
  end

  it "Test publication tab entry" do
    vivo_select_tab_on_profile('publications')
    $browser.find_element(:xpath, ".//h3[@id='presents']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Webpage (bibo)")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create \"related documents\" entry for Introduction to Primate Health")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("http://primatehealthintro.cornell.edu")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:css, "a.add-RO_0002234 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Happenings (Blog Posting)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
  end

  it "Test contact tab entry" do
    vivo_select_tab_on_profile('contact')
    $browser.find_element(:xpath, ".//h3[@id='contactInformation']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: contact information")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("ME Tarzan at metarzan@primates.edu or 555-555-5553")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:xpath, "(.//h3[@id='RO_0001025']/a)[2]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("lib")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:css, "a.add-RO_0001025 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Memorial Building")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
  end

  it "Test other tab entry" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:xpath, ".//h3[@id='courseCredits']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("9")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:css, "a.add-hasPrerequisite > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Introduction to Primates")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Introduction to Primate Health")
  end

  it "Verify everything entered is displaying properly" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    expect(browser_page_text).to include("Introduction to Primate Health")
    expect(browser_page_text).to include("Course")
    expect(browser_page_text).to include("Learn the basics about the general health of primates.")
    $browser.find_element(:link_text, "Primate College of America")
    expect(browser_page_text).to include("September 1, 2007 - December 15, 2007")
    $browser.find_element(:link_text, "Primate Health and Fitness")
    $browser.find_element(:link_text, "Primate Health Check")
    $browser.find_element(:link_text, "Primate Health Talks")
    $browser.find_element(:link_text, "Animal Health")
    $browser.find_element(:link_text, "Introduction to Primate Health")
    $browser.find_element(:link_text, "Africa")
    $browser.find_element(:link_text, "Primate Happenings")
    $browser.find_element(:link_text, "http://primatehealthintro.cornell.edu")
    expect(browser_page_text).to include("ME Tarzan at metarzan@primates.edu or 555-555-5553")
    $browser.find_element(:link_text, "Primate Memorial Building")
    $browser.find_element(:link_text, "Liberia")
    $browser.find_element(:link_text, "Introduction to Primates")
    expect(browser_page_text).to include("9")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
