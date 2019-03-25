shared_examples "Check Visualizations: Add Publications" do
  it "Add publications" do
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

  it "Add a book" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Book")
    expect(browser_page_text).to include("Title")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Nintendo: Good or Bad for Kids?")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    expect(browser_page_text).to include("book")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?")
    expect(browser_page_text).to include("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?").click
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:css, "a.add-publisher > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Publisher (vivo)")
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Putnam")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")

    vivo_select_tab_on_profile('additional_document_info')
    $browser.find_element(:css, "a.add-placeOfPublication > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("New York")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")

    vivo_select_tab_on_profile('overview')
    $browser.find_element(:css, "a.add-dateTimeValue > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "dateTimeField-year").clear
    $browser.find_element(:id, "dateTimeField-year").send_keys("2011")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
    # #<tr><td>pause</td><td>3000</td><td></td></tr>
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Add an Article" do
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Academic Article")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Why Games Are Important to Child Growth")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Why Games Are Important to Child Growth").click
    expect($browser.title).to eq("Why Games Are Important to Child Growth")
    
    vivo_select_tab_on_profile('additional_document_info')
    $browser.find_element(:xpath, ".//h3[@id='pageStart']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("111")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Why Games Are Important to Child Growth")
    $browser.find_element(:xpath, ".//h3[@id='pageEnd']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("222")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Why Games Are Important to Child Growth")
    
    vivo_select_tab_on_profile('overview')
    $browser.find_element(:xpath, ".//h3[@id='hasPublicationVenue']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Journal (bibo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Childhood Today")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Why Games Are Important to Child Growth")
    $browser.find_element(:xpath, ".//h3[@id='dateTimeValue']/a/img").click
    $browser.find_element(:id, "dateTimeField-year").clear
    $browser.find_element(:id, "dateTimeField-year").send_keys("2001")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Why Games Are Important to Child Growth")
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Add a Chapter" do
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Chapter")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Game Wars")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Game Wars").click
    expect($browser.title).to eq("Game Wars")

    vivo_select_tab_on_profile('additional_document_info')
    $browser.find_element(:xpath, ".//h3[@id='pageStart']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("333")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Game Wars")

    vivo_select_tab_on_profile('overview')
    $browser.find_element(:xpath, ".//h3[@id='chapter']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("9")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Game Wars")
    
    vivo_select_tab_on_profile('additional_document_info')
    $browser.find_element(:xpath, ".//h3[@id='pageEnd']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("444")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Game Wars")
    
    vivo_select_tab_on_profile('overview')
    $browser.find_element(:xpath, ".//h3[@id='dateTimeValue']/a/img").click
    $browser.find_element(:id, "dateTimeField-year").clear
    $browser.find_element(:id, "dateTimeField-year").send_keys("2013")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Game Wars")
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Add a Conference" do
    vivo_select_tab_on_profile('publications')
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Conference Paper")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Games to Promote Growth")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Games to Promote Growth").click
    expect($browser.title).to eq("Games to Promote Growth")
    $browser.find_element(:xpath, ".//h3[@id='presentedAt']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Game World 2005")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Games to Promote Growth")
    
    vivo_select_tab_on_profile('overview')
    $browser.find_element(:xpath, ".//h3[@id='dateTimeValue']/a/img").click
    $browser.find_element(:id, "dateTimeField-year").clear
    $browser.find_element(:id, "dateTimeField-year").send_keys("2005")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Games to Promote Growth")
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    browser_wait_for_jQuery
  end

  it "Verify there are no co-investigators" do
    expect($browser.find_elements(:link_text, "Co-investigator Network").size).to eq(0)
  end

  it "Verify Publication and Network Display" do
    expect(browser_page_text).to include("Publications in VIVO")
    expect(browser_page_text).to include("2 in the last 10 full")
    $browser.find_element(:link_text, "Co-author Network")
    $browser.find_element(:link_text, "Map of Science")
    $browser.find_element(:link_text, "Co-author Network").click
    browser_wait_for_jQuery
    expect($browser.title).to eq("Furter, Frank - Person Level Visualization")
    expect(browser_page_text).to include("Furter, Frank")
    expect(browser_page_text).to include("Co-author Network")
    $browser.find_element(:link_text, "GraphML file")
    expect(browser_page_text).to include("4 publications")
    expect(browser_page_text).to include("from 2001 - 2018")
    $browser.find_element(:link_text, "(.CSV File)")
    expect(browser_page_text).to include("0 co-authors")
    expect(browser_page_text).to include("from 2009 - 2018")
    expect(browser_page_text).to include("Tables")
    expect(browser_page_text).to include("Publications per year")
    $browser.find_element(:css, "caption > a")
    expect(browser_page_text).to include("2001")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("2013")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("2005")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("2011")
    expect(browser_page_text).to include("1")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
