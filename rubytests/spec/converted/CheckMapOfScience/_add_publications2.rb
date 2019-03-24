shared_examples "Check Map Of Science: Add Publications2" do
  it "Add academic article not included in Map of Science" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Add article for journal not included in Web of Science" do
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Academic Article")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("One For the Road")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "One For the Road").click
    expect($browser.title).to eq("One For the Road")

    vivo_select_tab_on_profile('additional_document_info')
    $browser.find_element(:css, "a.add-pageStart > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("456")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("One For the Road")
    $browser.find_element(:css, "a.add-pageEnd > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("468")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("One For the Road")

    vivo_select_tab_on_profile('overview')
    $browser.find_element(:css, "a.add-dateTimeValue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "dateTimeField-year").clear
    $browser.find_element(:id, "dateTimeField-year").send_keys("2008")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("One For the Road")

    vivo_select_tab_on_profile('additional_document_info')
    $browser.find_element(:css, "a.add-volume > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("15")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("One For the Road")
    $browser.find_element(:css, "a.add-issue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("8")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("One For the Road")

    vivo_select_tab_on_profile('overview')
    $browser.find_element(:css, "a.add-hasPublicationVenue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Journal (bibo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("DRINKY POOS")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("One For the Road")
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Verify Publications" do
    expect(browser_page_text).to include("Latest Alcohol Research.  ALCOHOL RESEARCH & HEALTH.  23:990-994. 2009")
    $browser.find_element(:link_text, "Latest Alcohol Research")
    expect(browser_page_text).to include("One For the Road.  DRINKY POOS.  15:456-468. 2008")
    $browser.find_element(:link_text, "One For the Road")
    expect(browser_page_text).to include("What should I drink?.  Alcohol And Alcoholism.  55:345-367. 2007")
    $browser.find_element(:link_text, "What should I drink?")
    expect(browser_page_text).to include("Alcohol Poisoning Treatment.  Alcohol.  12:222-229. 2005")
    $browser.find_element(:link_text, "Alcohol Poisoning Treatment")
    expect(browser_page_text).to include("Dying for a Drink.  Alcohol.  9:111-119. 2005")
    $browser.find_element(:link_text, "Dying for a Drink")
  end

  it "Check Map of Science" do
    $browser.find_element(:link_text, "Map of Science").click
    browser_wait_for_jQuery
    expect($browser.title).to eq("Furter, Frank - Map of Science Visualization")
    
    #
    # This is hidden, and I don't see a way to display it.
    #
    # It would allow the user to choose whether to "explore" the faculty member or
    # to compare organizations. Perhaps it is not displayed because there are
    # no organizations to compare?
    #
    $browser.find_element(:name, "view-type").click
    
    browser_wait_for_jQuery
    $browser.find_element(:id, "first-filter").click
    browser_wait_for_jQuery
    expect($browser.title).to eq("Furter, Frank - Map of Science Visualization")
    browser_wait_for_jQuery
    expect(browser_page_text).to include("Furter, Frank")
    expect(browser_page_text).to include("Explore activity (4 publications) across 554 scientific subdisciplines")
    expect(browser_page_text).to include("554 Subdisciplines")
    expect(browser_page_text).to include("13 Disciplines")
    expect(browser_page_text).to include("Neurotoxicology")
    expect(browser_page_text).to include("4.0")
    expect(browser_page_text).to include("100.0")
    expect(browser_page_text).to include("mapped 100.00% of 4 publications")
  end

  it "Check 13 Disciplines" do
    $browser.find_element(:id, "second-filter").click
    browser_wait_for_jQuery
    expect(browser_page_text).to include("Brain Research")
    expect(browser_page_text).to include("4.0")
    $browser.find_element(:xpath, ".//tr[@id='DISCIPLINE-5']/td[3]").click
    browser_wait_for_jQuery
    expect(browser_page_text).to include("100.0")
  end

  it "Back to 554 Subdisciplines" do
    $browser.find_element(:id, "first-filter").click
    browser_wait_for_jQuery
    $browser.find_element(:css, "td..sorting_2").click
    browser_wait_for_jQuery
    expect(browser_page_text).to include("Neurotoxicology")
    expect(browser_page_text).to include("4.0")
    expect(browser_page_text).to include("100.0")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
