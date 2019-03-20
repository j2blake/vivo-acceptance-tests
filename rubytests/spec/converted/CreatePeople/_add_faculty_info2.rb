shared_examples "Create People: Add Faculty Info2" do
  it "Add a second value for fields entered via AddFacultyInfo" do
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

  it "Add second value to fields allowed more than one value" do
    $browser.find_element(:xpath, ".//h2[@id='hasResearchArea']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:link_text, "Select or create a VIVO-defined concept.").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "relatedIndLabel").clear
    $browser.find_element(:id, "relatedIndLabel").send_keys("African Primates")
    $browser.find_element(:id, "submit").click
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//img[@alt='manage']").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:name, "urlType").select_by(:text, "Standard Web Link")
    $browser.find_element(:id, "url").clear
    $browser.find_element(:id, "url").send_keys("http://cit.cprnell.edu")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("CIT Homepage")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "returnToIndividual").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-geographicFocus > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("southern afri")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[36]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "award").clear
    $browser.find_element(:id, "award").send_keys("Chimp Lover for Life")
    vivo_click_and_wait_for_indexing(:css, "input.submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[4]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "telephoneNumber").clear
    $browser.find_element(:id, "telephoneNumber").send_keys("607-288-8888")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[41]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "telephoneNumber").clear
    $browser.find_element(:id, "telephoneNumber").send_keys("607-299-9999")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-ARG_2000028 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "emailAddress").clear
    $browser.find_element(:id, "emailAddress").send_keys("jane@gmail.com")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "article.property > #ARG_2000028 > a.add-ARG_2000028 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "streetAddressOne").clear
    $browser.find_element(:id, "streetAddressOne").send_keys("CIT Cornell University")
    $browser.find_element(:id, "city").clear
    $browser.find_element(:id, "city").send_keys("Ithaca")
    $browser.find_element(:id, "state").clear
    $browser.find_element(:id, "state").send_keys("New York")
    $browser.find_element(:id, "postalCode").clear
    $browser.find_element(:id, "postalCode").send_keys("14853")
    $browser.find_element(:id, "countryEditMode").clear
    $browser.find_element(:id, "countryEditMode").send_keys("United States of America")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//h3[@id='orcidId']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "orcidIdDisplay").clear
    $browser.find_element(:id, "orcidIdDisplay").send_keys("454545")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//h3[@id='researcherId']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("67676767")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//h3[@id='scopusId']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("987654321")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("African Primates")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add new release 1.3 fields" do
    $browser.find_element(:css, "a.add-eRACommonsId > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("ABC123987")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Updated test case to add two more fields for 1.6" do
    $browser.find_element(:css, "a.add-ARG_0000197 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("2727272727272727")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-hasCollaborator > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("Librar")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify all fields added" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor")
    expect(browser_page_text).to include("I am named after Jane in the Tarzan stories. Yes, my last name really is faculty.")
    $browser.find_element(:link_text, "African Primates")
    $browser.find_element(:link_text, "Primatia Africana")
    $browser.find_element(:link_text, "Mozamia")
    $browser.find_element(:link_text, "southern Africa")
    $browser.find_element(:link_text, "mejane@primates-r-us.com")
    $browser.find_element(:link_text, "jane@gmail.com")
    $browser.find_element(:link_text, "jfac@gmail.com")
    expect(browser_page_text).to include("607-266-6666")
    expect(browser_page_text).to include("607-288-8888")
    $browser.find_element(:link_text, "CUL Homepage")
    $browser.find_element(:link_text, "CIT Homepage")
    $browser.find_element(:link_text, "Adams, John")
    expect(browser_page_text).to include("Adams, John   Faculty Member Emeritus")
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Librarian, Lily Lou  Assistant Librarian")
    $browser.find_element(:link_text, "Apes on Parade")
    expect(browser_page_text).to include("Apes on Parade 1991 -")
    $browser.find_element(:link_text, "Ape Week")
    expect(browser_page_text).to include("Ape Week  (Newsletter) 1988 - 1990")
    $browser.find_element(:link_text, "Primate Reactions")
    $browser.find_element(:link_text, "USA1234567890")
    expect(browser_page_text).to include("I study apes, of course.")
    expect(browser_page_text).to include("African Apes")
    expect(browser_page_text).to include("African Primates")
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
    $browser.find_element(:link_text, "Chimp Lover for Life")
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
    expect(browser_page_text).to include("CIT Cornell University")
    expect(browser_page_text).to include("Ithaca, New York  14853")
    expect(browser_page_text).to include("United States of America")
    expect(browser_page_text).to include("607-299-9999")
    expect(browser_page_text).to include("607-277-7777")
    $browser.find_element(:link_text, "http://orcid.org/11111")
    $browser.find_element(:link_text, "http://orcid.org/454545")
    expect(browser_page_text).to include("ABC121212")
    expect(browser_page_text).to include("ABC123987")
    expect(browser_page_text).to include("222222")
    expect(browser_page_text).to include("67676767")
    $browser.find_element(:link_text, "3333333")
    $browser.find_element(:link_text, "987654321")
    expect(browser_page_text).to include("2727272727272727")
    expect(browser_page_text).to include("976976976976")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
