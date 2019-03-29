shared_examples "Create People: Add Faculty Info" do
  it "Add all available fields that aren't tested elsewhere" do
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

  it "Add top fields" do
    $browser.find_element(:xpath, ".//h2[@id='hasResearchArea']/a/img").click
    expect(browser_page_text).to include("Manage Concepts")
    expect(browser_page_text).to include("There are currently no concepts specified.")
    $browser.find_element(:link_text, "Return to Profile Page")
    $browser.find_element(:id, "showAddFormButton").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Select or create a VIVO-defined concept.").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create Your Own Concept")
    expect(browser_page_text).to include("Concept")
    $browser.find_element(:link_text, "Return to Manage Concepts").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Manage Concepts")
    expect(browser_page_text).to include("There are currently no concepts specified.")
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:link_text, "Select or create a VIVO-defined concept.").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "relatedIndLabel").clear
    $browser.find_element(:id, "relatedIndLabel").send_keys("Primatia")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//img[@alt='manage']").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Faculty, Jane")
    expect(browser_page_text).to include("Manage Web Pages")
    expect(browser_page_text).to include("This individual currently has no web pages specified. Add a new web page by clicking on the button below.")
    $browser.find_element(:id, "showAddFormButton").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add webpage for Faculty, Jane")
    expect(browser_page_text).to include("URL Type")
    expect(browser_page_text).to include("URL")
    expect(browser_page_text).to include("Webpage Name")
    browser_find_select_list(:name, "urlType").select_by(:text, "Standard Web Link")
    $browser.find_element(:id, "url").clear
    $browser.find_element(:id, "url").send_keys("http://mannlib.cornell.edu")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Mann Library Homepage")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Faculty, Jane")
    expect(browser_page_text).to include("Manage Web Pages")
    $browser.find_element(:link_text, "Mann Library Homepage")
    $browser.find_element(:link_text, "Edit")
    $browser.find_element(:link_text, "Delete")
    $browser.find_element(:id, "showAddFormButton")
    $browser.find_element(:id, "returnToIndividual")
    $browser.find_element(:id, "returnToIndividual").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//h2[@id='overview']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("I am named after Jane in the Tarzan stories.")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-geographicFocus > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("Afri")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[4]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "telephoneNumber").clear
    $browser.find_element(:id, "telephoneNumber").send_keys("607-255-5555")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-ARG_2000028 > img.add-individual").click
    $browser.find_element(:id, "emailAddress").clear
    $browser.find_element(:id, "emailAddress").send_keys("mejane@africa.com")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[3]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "emailAddress").clear
    $browser.find_element(:id, "emailAddress").send_keys("jfac@gmail.com")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Enter Affiliation tab fields" do
    browser_wait_for_jQuery
    $browser.find_element(:xpath, ".//h3[@id='hasCollaborator']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("Libra")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "submit").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[11]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Performance")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Apes on Parade")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1991")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add Publications tab fields" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[4]").click
    $browser.find_element(:css, "a.add-assigneeFor > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect($browser.find_element(:id, "offerCreate")["value"]).to eq("Add a new item of this type")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("USABC123456789")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "#publicationsGroup > article.property > #RO_0000053 > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Newsletter")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Ape Week")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1988")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("1990")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-featuredIn > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Case Study (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Reactions")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-translatorOf > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Primate Reactions (Case Study)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add Research tab fields" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//h3[@id='researchOverview']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("I study monkeys, of course.")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Apes")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add Teaching tab fields" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[26]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "selector").select_by(:text, "Postdoc or Fellow Advising Relationship")
    $browser.find_element(:id, "advisee").clear
    $browser.find_element(:id, "advisee").send_keys("Smith")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Joe")
    $browser.find_element(:id, "SubjectArea").clear
    $browser.find_element(:id, "SubjectArea").send_keys("Primates-R-Us Fellowship")
    $browser.find_element(:css, "input.submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//h3[@id='teachingOverview']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("I teach monkeys to communicate.")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add Service tab fields" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[10]").click
    $browser.find_element(:xpath, ".//h3[@id='outreachOverview']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("I travel the country teaching monkeys in zoos how to communicate.")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-ERO_0000037 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Training Service (obo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Feeding")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "#serviceGroup > article.property > #RO_0000053 > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Conference Poster")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Variety of Apes in Africa")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1983")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("1983")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[29]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Exhibit")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Primates of East Africa")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("1984")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-ERO_0000397 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Technique (obo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("JF Feeding")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-ERO_0000033 > img.add-individual").click
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Technique (obo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("JF Feeding Revised")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add Background tab fields" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[36]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "award").clear
    $browser.find_element(:id, "award").send_keys("Monkey Trainer of the Year")
    $browser.find_element(:css, "input.submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-eligibleFor > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-eligibleFor > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Cancel").click
    $browser.find_element(:css, "a.add-eligibleFor > img.add-individual").click
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Credential (vivo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Primate Expert Association")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "#backgroundGroup > article.property > #relatedBy > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "License")
    $browser.find_element(:id, "credential").clear
    $browser.find_element(:id, "credential").send_keys("Licensed Primate Expert")
    $browser.find_element(:css, "input.submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "#backgroundGroup > article.property > #RO_0000053 > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "selector").select_by(:text, "Faculty Mentoring Relationship")
    $browser.find_element(:id, "advisor").clear
    $browser.find_element(:id, "advisor").send_keys("Adams")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Amy")
    $browser.find_element(:id, "SubjectArea").clear
    $browser.find_element(:id, "SubjectArea").send_keys("Primate Feeding")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2013")
    $browser.find_element(:css, "input.submit").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add Contact tab fields" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[14]").click
    $browser.find_element(:css, "#ARG_2000028-Name-List > li > a.edit-ARG_2000028 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Jane")
    $browser.find_element(:id, "middleName").clear
    $browser.find_element(:id, "middleName").send_keys("Elizabeth")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Faculty")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[41]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "telephoneNumber").clear
    $browser.find_element(:id, "telephoneNumber").send_keys("607-244-4444")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "article.property > #ARG_2000028 > a.add-ARG_2000028 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "streetAddressOne").clear
    $browser.find_element(:id, "streetAddressOne").send_keys("The Jungle")
    $browser.find_element(:id, "city").clear
    $browser.find_element(:id, "city").send_keys("Congo City")
    $browser.find_element(:id, "state").clear
    $browser.find_element(:id, "state").send_keys("Congola State")
    $browser.find_element(:id, "postalCode").clear
    $browser.find_element(:id, "postalCode").send_keys("1234567890")
    $browser.find_element(:id, "countryEditMode").clear
    $browser.find_element(:id, "countryEditMode").send_keys("Democratic Republic of Congo")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "#ARG_2000028-Name-List > li > a.edit-ARG_2000028 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "prefix").clear
    $browser.find_element(:id, "prefix").send_keys("Ms.")
    $browser.find_element(:id, "suffix").clear
    $browser.find_element(:id, "suffix").send_keys("III")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Add Identify tab fields" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[16]").click
    $browser.find_element(:xpath, ".//h3[@id='orcidId']/a/img").click
    $browser.find_element(:id, "orcidIdDisplay").clear
    $browser.find_element(:id, "orcidIdDisplay").send_keys("1234")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//h3[@id='researcherId']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("123456789")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//h3[@id='scopusId']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("5678")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-eRACommonsId > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Cancel").click
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-eRACommonsId > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: eRA Commons ID")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("ABC123987")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-ARG_0000197 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("976976976976")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify all fields above tabs" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify top part" do
    expect(browser_page_text).to include("Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor")
    expect(browser_page_text).to include("I am named after Jane in the Tarzan stories.")
    $browser.find_element(:link_text, "Primatia")
    $browser.find_element(:link_text, "Africa")
    $browser.find_element(:link_text, "mejane@africa.com")
    $browser.find_element(:link_text, "jfac@gmail.com")
    expect(browser_page_text).to include("607-255-5555")
    $browser.find_element(:link_text, "Mann Library Homepage")
  end

  it "Verify entered fields under AFFILIATION tab" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Librarian, Lily Lou  Assistant Librarian")
    $browser.find_element(:link_text, "Apes on Parade")
    expect(browser_page_text).to include("Apes on Parade 1991 -")
  end

  it "Verify entered fields under PUBLICATIONS tab" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:link_text, "Ape Week")
    expect(browser_page_text).to include("Ape Week  (Newsletter) 1988 - 1990")
    $browser.find_element(:link_text, "Primate Reactions")
    $browser.find_element(:link_text, "USABC123456789")
  end

  it "Verify entered fields under RESEARCH tab" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    expect(browser_page_text).to include("I study monkeys, of course.")
    expect(browser_page_text).to include("Apes")
  end

  it "Verify entered field under TEACHING tab" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    expect(browser_page_text).to include("I teach monkeys to communicate.")
    expect(browser_page_text).to include("postdoc or fellow advising relationship")
    $browser.find_element(:link_text, "Smith, Joe")
  end

  it "Verify entered fields under SERVICE tab" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[10]").click
    expect(browser_page_text).to include("I travel the country teaching monkeys in zoos how to communicate.")
    $browser.find_element(:link_text, "Variety of Apes in Africa")
    expect(browser_page_text).to include("Variety of Apes in Africa  (Conference Poster) 1983")
    $browser.find_element(:link_text, "Primate Feeding")
    $browser.find_element(:link_text, "Primates of East Africa")
    expect(browser_page_text).to include("Primates of East Africa 1984 -")
    $browser.find_element(:link_text, "JF Feeding")
    $browser.find_element(:link_text, "JF Feeding Revised")
  end

  it "Verify entered fields under BACKGROUND tab" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    $browser.find_element(:link_text, "Licensed Primate Expert")
    $browser.find_element(:link_text, "Primate Expert Association")
    $browser.find_element(:link_text, "Monkey Trainer of the Year")
    expect(browser_page_text).to include("Adams, Amy, 2013 -")
    $browser.find_element(:link_text, "Adams, Amy")
  end

  it "Verify entered fields under CONTACT tab" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[14]").click
    expect(browser_page_text).to include("Ms. Jane Elizabeth Faculty, III")
    expect(browser_page_text).to include("The Jungle")
    expect(browser_page_text).to include("Congo City")
    expect(browser_page_text).to include("Congola State")
    expect(browser_page_text).to include("1234567890")
    expect(browser_page_text).to include("Democratic Republic of Congo")
    expect(browser_page_text).to include("607-244-4444")
  end

  it "Verify entered fields under IDENTITY tab" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[16]").click
    $browser.find_element(:link_text, "http://orcid.org/1234")
    expect(browser_page_text).to include("ABC123987")
    expect(browser_page_text).to include("123456789")
    $browser.find_element(:link_text, "5678")
    expect(browser_page_text).to include("976976976976")
  end

  it "Check fields again under VIEW ALL tab" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Librarian, Lily Lou  Assistant Librarian")
    $browser.find_element(:link_text, "Apes on Parade")
    expect(browser_page_text).to include("Apes on Parade 1991 -")
    $browser.find_element(:link_text, "Ape Week")
    expect(browser_page_text).to include("Ape Week  (Newsletter) 1988 - 1990")
    $browser.find_element(:link_text, "Primate Reactions")
    $browser.find_element(:link_text, "USABC123456789")
    expect(browser_page_text).to include("I study monkeys, of course.")
    expect(browser_page_text).to include("Apes")
    expect(browser_page_text).to include("I teach monkeys to communicate.")
    expect(browser_page_text).to include("postdoc or fellow advising relationship")
    $browser.find_element(:link_text, "Smith, Joe")
    expect(browser_page_text).to include("I travel the country teaching monkeys in zoos how to communicate.")
    $browser.find_element(:link_text, "Variety of Apes in Africa")
    expect(browser_page_text).to include("Variety of Apes in Africa  (Conference Poster) 1983")
    $browser.find_element(:link_text, "Primate Feeding")
    $browser.find_element(:link_text, "Primates of East Africa")
    expect(browser_page_text).to include("Primates of East Africa 1984 -")
    $browser.find_element(:link_text, "JF Feeding")
    $browser.find_element(:link_text, "JF Feeding Revised")
    $browser.find_element(:link_text, "Licensed Primate Expert")
    $browser.find_element(:link_text, "Primate Expert Association")
    $browser.find_element(:link_text, "Monkey Trainer of the Year")
    expect(browser_page_text).to include("faculty mentoring relationship")
    $browser.find_element(:link_text, "Adams, Amy")
    expect(browser_page_text).to include("Adams, Amy, 2013 -")
    expect(browser_page_text).to include("Ms. Jane Elizabeth Faculty, III")
    expect(browser_page_text).to include("The Jungle")
    expect(browser_page_text).to include("Congo City")
    expect(browser_page_text).to include("Congola State")
    expect(browser_page_text).to include("1234567890")
    expect(browser_page_text).to include("Democratic Republic of Congo")
    expect(browser_page_text).to include("607-244-4444")
    $browser.find_element(:link_text, "http://orcid.org/1234")
    expect(browser_page_text).to include("ABC123987")
    expect(browser_page_text).to include("123456789")
    $browser.find_element(:link_text, "5678")
    expect(browser_page_text).to include("976976976976")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
