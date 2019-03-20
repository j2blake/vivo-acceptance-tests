shared_examples "Create People: Edit Faculty Info" do
  it "Edit all available fields that aren't tested elsewhere" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Find Jane Faculty via Index" do
    $browser.find_element(:link_text, "Index").click
    expect(browser_page_text).to include("Faculty Member")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Edit all fields" do
    $browser.find_element(:css, "a.add-hasResearchArea > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Remove").click
    browser_accept_alert("Are you sure you want to remove this term?")
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:link_text, "Select or create a VIVO-defined concept.").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "relatedIndLabel").clear
    $browser.find_element(:id, "relatedIndLabel").send_keys("Primatia Africana")
    $browser.find_element(:id, "submit").click
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//img[@alt='manage']").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Delete").click
    browser_accept_alert("Are you sure you want to remove this web page?")
    $browser.find_element(:id, "showAddFormButton").click
    expect($browser.title).to eq("Edit")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    browser_find_select_list(:name, "urlType").select_by(:text, "Standard Web Link")
    $browser.find_element(:id, "url").clear
    $browser.find_element(:id, "url").send_keys("http://library.cornell.edu")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("CUL Homepage")
    $browser.find_element(:id, "submit").click
    $browser.find_element(:id, "returnToIndividual").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//section[@id='individual-info']/div/a[1]/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("I am named after Jane in the Tarzan stories. Yes, my last name really is faculty.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.edit-hasCollaborator > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Faculty Member Emeritus (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("John")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Adams")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.edit-researchOverview > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("I study apes, of course.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.edit-geographicFocus > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "County (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Mozamia")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-geographicFocus > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.edit-teachingOverview > img.edit-individual").click
    browser_fill_tinyMCE("I teach apes how to communicate with humans.")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.edit-outreachOverview > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("I travel the world teaching apes how to communicate with humans.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "#relatedBy-AwardReceipt-List > li > a.delete-relatedBy > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[36]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "award").clear
    $browser.find_element(:id, "award").send_keys("Ape Trainer of the Decade")
    $browser.find_element(:id, "org").clear
    $browser.find_element(:id, "org").send_keys("Professional Ape Trainer Association")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "#ARG_2000028-Name-List > li > a.edit-ARG_2000028 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "middleName").clear
    $browser.find_element(:id, "middleName").send_keys("E.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "#individual-phone > li > a.edit-ARG_2000028 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "telephoneNumber").clear
    $browser.find_element(:id, "telephoneNumber").send_keys("607-266-6666")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "#ARG_2000028-Fax-List > li > a.edit-ARG_2000028 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "telephoneNumber").clear
    $browser.find_element(:id, "telephoneNumber").send_keys("607-277-7777")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "emailAddress").clear
    $browser.find_element(:id, "emailAddress").send_keys("mejane@primates-r-us.com")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "#ARG_2000028-Address-List > li > a.edit-ARG_2000028 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "streetAddressOne").clear
    $browser.find_element(:id, "streetAddressOne").send_keys("Jungle 1234")
    $browser.find_element(:id, "streetAddressTwo").clear
    $browser.find_element(:id, "streetAddressTwo").send_keys("Tree 99")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "#ARG_2000028-Name-List > li > a.edit-ARG_2000028 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "prefix").clear
    $browser.find_element(:id, "prefix").send_keys("Mrs.")
    $browser.find_element(:id, "suffix").clear
    $browser.find_element(:id, "suffix").send_keys("Jr.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.edit-orcidId > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "orcidIdDisplay").clear
    $browser.find_element(:id, "orcidIdDisplay").send_keys("11111")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.edit-researcherId > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("222222")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.edit-scopusId > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("3333333")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-freetextKeyword > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("African Apes")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Edit new release 1.3 fields" do
    $browser.find_element(:css, "a.edit-eligibleFor > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "License (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Experts")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-relatedBy > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "#backgroundGroup > article.property > #relatedBy > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "License")
    $browser.find_element(:id, "credential").clear
    $browser.find_element(:id, "credential").send_keys("Licensed Primate Instructor")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.edit-eRACommonsId > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("ABC121212")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-assigneeFor > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-assigneeFor > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("USA1234567890")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify all fields updated" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor")
    expect(browser_page_text).to include("I am named after Jane in the Tarzan stories. Yes, my last name really is faculty.")
    $browser.find_element(:link_text, "Primatia Africana")
    $browser.find_element(:link_text, "Mozamia")
    $browser.find_element(:link_text, "mejane@primates-r-us.com")
    $browser.find_element(:link_text, "jfac@gmail.com")
    expect(browser_page_text).to include("607-266-6666")
    $browser.find_element(:link_text, "CUL Homepage")
    $browser.find_element(:link_text, "Adams, John")
    expect(browser_page_text).to include("Adams, John   Faculty Member Emeritus")
    $browser.find_element(:link_text, "Apes on Parade")
    expect(browser_page_text).to include("Apes on Parade 1991 -")
    $browser.find_element(:link_text, "Ape Week")
    expect(browser_page_text).to include("Ape Week  (Newsletter) 1988 - 1990")
    $browser.find_element(:link_text, "Primate Reactions")
    $browser.find_element(:link_text, "USA1234567890")
    expect(browser_page_text).to include("I study apes, of course.")
    expect(browser_page_text).to include("African Apes")
    expect(browser_page_text).to include("I teach apes how to communicate with humans.")
    expect(browser_page_text).to include("postdoc or fellow advising relationship")
    $browser.find_element(:link_text, "Smith, Joe")
    expect(browser_page_text).to include("I travel the world teaching apes how to communicate with humans.")
    $browser.find_element(:link_text, "Variety of Apes in Africa")
    expect(browser_page_text).to include("Variety of Apes in Africa  (Conference Poster) 1983")
    $browser.find_element(:link_text, "Primate Feeding")
    $browser.find_element(:link_text, "Primates of East Africa")
    expect(browser_page_text).to include("Primates of East Africa 1984 -")
    $browser.find_element(:link_text, "JF Feeding")
    $browser.find_element(:link_text, "JF Feeding Revised")
    $browser.find_element(:link_text, "Licensed Primate Instructor")
    $browser.find_element(:link_text, "Primate Experts")
    $browser.find_element(:link_text, "Ape Trainer of the Decade")
    expect(browser_page_text).to include("Ape Trainer of the Decade, conferred by Professional Ape Trainer Association")
    $browser.find_element(:link_text, "Professional Ape Trainer Association")
    expect(browser_page_text).to include("faculty mentoring relationship")
    $browser.find_element(:link_text, "Adams, Amy")
    expect(browser_page_text).to include("Adams, Amy, 2013 -")
    expect(browser_page_text).to include("Mrs. Jane E. Faculty, Jr.")
    expect(browser_page_text).to include("Jungle 1234")
    expect(browser_page_text).to include("Tree 99")
    expect(browser_page_text).to include("Congo City")
    expect(browser_page_text).to include("Congola State")
    expect(browser_page_text).to include("1234567890")
    expect(browser_page_text).to include("Democratic Republic of Congo")
    expect(browser_page_text).to include("607-277-7777")
    $browser.find_element(:link_text, "http://orcid.org/11111")
    expect(browser_page_text).to include("ABC121212")
    expect(browser_page_text).to include("222222")
    $browser.find_element(:link_text, "3333333")
    expect(browser_page_text).to include("976976976976")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
