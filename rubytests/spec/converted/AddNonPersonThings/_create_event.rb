shared_examples "Add Non Person Things: Create Event" do
  it "Validate adding Event" do
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
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Conference (bibo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Conference")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Select to add then enter empty field" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Conference (bibo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Conference")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please enter a value in the Name field.")
  end

  it "Now enter something in the field" do
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Health Conference")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
  end

  it "Test overview entry (image and webpage have been tested)" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:xpath, ".//h3[@id='description']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: description")
    browser_fill_tinyMCE("First annual conference for those interested in the general health of primates.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
    $browser.find_element(:xpath, ".//h3[@id='hasProceedings']/a/img").click
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("PHC Proceedings")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Conference").click
    expect($browser.title).to eq("Conference")
    $browser.find_element(:link_text, "Primate Health Conference").click
    expect($browser.title).to eq("Primate Health Conference")
    $browser.find_element(:xpath, ".//h3[@id='contactInformation']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: contact information")
    browser_fill_tinyMCE("info@primateconf.org")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
  end

  it "Test research entry" do
    $browser.find_element(:xpath, ".//h3[@id='geographicFocus']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:id, "object").send_keys("Kenya")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
  end

  it "Test location entry" do
    $browser.find_element(:xpath, "(.//h3[@id='RO_0001025']/a)[2]").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    expect(browser_page_text).to include("Geographic Location Name")
    $browser.find_element(:id, "object").send_keys("Cong")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
    $browser.find_element(:css, "a.add-RO_0001025 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Facility (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("State Fair Park")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
  end

  it "Test time entry" do
    $browser.find_element(:xpath, ".//h3[@id='dateTimeInterval']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2011")
    browser_find_select_list(:id, "startField-month").select_by(:text, "1")
    browser_find_select_list(:id, "startField-day").select_by(:text, "5")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2011")
    browser_find_select_list(:id, "endField-month").select_by(:text, "1")
    browser_find_select_list(:id, "endField-day").select_by(:text, "9")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
  end

  it "Test related documents entry" do
    expect($browser.title).to eq("Primate Health Conference")
    $browser.find_element(:xpath, ".//h3[@id='presents']/a/img").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
  end

  it "Test other entry" do
    $browser.find_element(:css, "a.add-BFO_0000051 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Health Check (Event)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
    $browser.find_element(:css, "a.add-hasSubjectArea > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:link_text, "Select or create a VIVO-defined concept.").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "relatedIndLabel").send_keys("Anim")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Primate Health Conference")
    $browser.find_element(:xpath, ".//h3[@id='abbreviation']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("PrimHConf")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
  end

  it "Test remaining fields (added for 1.6)" do
    $browser.find_element(:css, "a.add-BFO_0000050 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Health and Fitness (Invited Talk)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[6]").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
    $browser.find_element(:css, "a.add-RO_0002234 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Happenings (Blog Posting)")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Primate Health Conference")
  end

  it "Verify everything entered is displaying properly" do
    expect(browser_page_text).to include("Primate Health Conference")
    expect(browser_page_text).to include("Conference")
    expect(browser_page_text).to include("First annual conference for those interested in the general health of primates.")
    expect(browser_page_text).to include("PrimHConf")
    expect(browser_page_text).to include("January 5, 2011 - January 9, 2011")
    $browser.find_element(:link_text, "Primate Health and Fitness")
    $browser.find_element(:link_text, "Primate Health Check")
    $browser.find_element(:link_text, "Primate Health Talks")
    $browser.find_element(:link_text, "Animal Health")
    $browser.find_element(:link_text, "PHC Proceedings")
    $browser.find_element(:link_text, "Kenya")
    $browser.find_element(:link_text, "Primate Happenings")
    $browser.find_element(:link_text, "http://primatehealthintro.cornell.edu")
    expect(browser_page_text).to include("info@primateconf.org")
    $browser.find_element(:link_text, "State Fair Park")
    $browser.find_element(:link_text, "Congo")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
