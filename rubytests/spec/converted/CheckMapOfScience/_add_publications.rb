shared_examples "Check Map Of Science: Add Publications" do
  it "Add academic articles included in Map of Science" do
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

  it "Add first journal article" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
    expect(browser_page_text).to include("Title")
    expect(browser_page_text).to include("Publication Date")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Academic Article")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Dying for a Drink")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Dying for a Drink").click
    expect($browser.title).to eq("Dying for a Drink")
    $browser.find_element(:css, "a.add-pageStart > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("111")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Dying for a Drink")
    $browser.find_element(:css, "a.add-pageEnd > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("119")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Dying for a Drink")
    $browser.find_element(:css, "a.add-dateTimeValue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "dateTimeField-year").clear
    $browser.find_element(:id, "dateTimeField-year").send_keys("2005")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Dying for a Drink")
    $browser.find_element(:css, "a.add-volume > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("9")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Dying for a Drink")
    $browser.find_element(:css, "a.add-issue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("2")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Dying for a Drink")
    $browser.find_element(:css, "a.add-hasPublicationVenue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Journal (bibo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Alcohol")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Dying for a Drink")
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Add second journal article" do
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Academic Article")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Alcohol Poisoning Treatment")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Alcohol Poisoning Treatment").click
    expect($browser.title).to eq("Alcohol Poisoning Treatment")
    $browser.find_element(:css, "a.add-pageStart > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("222")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Alcohol Poisoning Treatment")
    $browser.find_element(:css, "a.add-pageEnd > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("229")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Alcohol Poisoning Treatment")
    $browser.find_element(:css, "a.add-dateTimeValue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "dateTimeField-year").clear
    $browser.find_element(:id, "dateTimeField-year").send_keys("2005")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Alcohol Poisoning Treatment")
    $browser.find_element(:css, "a.add-volume > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("12")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Alcohol Poisoning Treatment")
    $browser.find_element(:css, "a.add-issue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("4")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Alcohol Poisoning Treatment")
    $browser.find_element(:css, "a.add-hasPublicationVenue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Alcohol Poisoning Treatment")
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Add third journal article" do
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Academic Article")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("What should I drink?")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "What should I drink?").click
    expect($browser.title).to eq("What should I drink?")
    $browser.find_element(:css, "a.add-pageStart > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("345")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("What should I drink?")
    $browser.find_element(:css, "a.add-pageEnd > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("367")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("What should I drink?")
    $browser.find_element(:css, "a.add-dateTimeValue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "dateTimeField-year").clear
    $browser.find_element(:id, "dateTimeField-year").send_keys("2007")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("What should I drink?")
    $browser.find_element(:css, "a.add-volume > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("55")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("What should I drink?")
    $browser.find_element(:css, "a.add-issue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("1")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("What should I drink?")
    $browser.find_element(:css, "a.add-hasPublicationVenue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Journal (bibo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Alcohol And Alcoholism")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("What should I drink?")
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Add fourth journal article" do
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Academic Article")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Latest Alcohol Research")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Latest Alcohol Research").click
    expect($browser.title).to eq("Latest Alcohol Research")
    $browser.find_element(:css, "a.add-pageStart > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("990")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Latest Alcohol Research")
    $browser.find_element(:css, "a.add-pageEnd > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("994")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Latest Alcohol Research")
    $browser.find_element(:css, "a.add-dateTimeValue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "dateTimeField-year").clear
    $browser.find_element(:id, "dateTimeField-year").send_keys("2009")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Latest Alcohol Research")
    $browser.find_element(:css, "a.add-volume > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("23")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Latest Alcohol Research")
    $browser.find_element(:css, "a.add-issue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("4")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Latest Alcohol Research")
    $browser.find_element(:css, "a.add-hasPublicationVenue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Journal (bibo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("ALCOHOL RESEARCH & HEALTH")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Latest Alcohol Research")
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
    expect(browser_page_text).to include("What should I drink?.  Alcohol And Alcoholism.  55:345-367. 2007")
    $browser.find_element(:link_text, "exact:What should I drink?")
    expect(browser_page_text).to include("Alcohol Poisoning Treatment.  Alcohol.  12:222-229. 2005")
    $browser.find_element(:link_text, "Alcohol Poisoning Treatment")
    expect(browser_page_text).to include("Dying for a Drink.  Alcohol.  9:111-119. 2005")
    $browser.find_element(:link_text, "Dying for a Drink")
  end

  it "Rebuild Visualization Cache" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Rebuild visualization cache").click
    expect($browser.title).to eq("Visualization Tools")
    $browser.find_element(:link_text, "Refresh Cached Models for Visualization").click
    expect($browser.title).to eq("Regenerate Constructed Models")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Check Map of Science" do
    $browser.find_element(:link_text, "Map of Science").click
    expect($browser.title).to eq("Furter, Frank - Map of Science Visualization")
    expect(browser_page_text).to include("Furter, Frank")
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    $browser.find_element(:id, "entityMoniker")
    expect(browser_page_text).to include("Explore activity (4 publications) across 554 scientific subdisciplines")
    expect(browser_page_text).to include("554 Subdisciplines")
    expect(browser_page_text).to include("13 Disciplines")
    $browser.find_element(:id, "second-filter")
    expect(browser_page_text).to include("Search:")
    expect(browser_page_text).to include("Neurotoxicology")
    expect(browser_page_text).to include("4.0")
    expect(browser_page_text).to include("100.0")
    expect(browser_page_text).to include("mapped 100.00% of 4 publications")
  end

  it "Check 13 Disciplines" do
    $browser.find_element(:id, "second-filter").click
    expect(browser_page_text).to include("Brain Research")
    expect(browser_page_text).to include("4.0")
    $browser.find_element(:xpath, ".//tr[@id='DISCIPLINE-5']/td[3]").click
    expect(browser_page_text).to include("100.0")
  end

  it "Back to 554 Subdisciplines" do
    $browser.find_element(:id, "first-filter").click
    $browser.find_element(:css, "td..sorting_2").click
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
