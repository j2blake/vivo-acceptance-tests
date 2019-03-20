shared_examples "Create People: Delete Faculty Info" do
  it "Delete all fields added by *FacultyInfo test casesd" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Find Jane Faculty via Index" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect(browser_page_text).to include("Faculty Member")
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Delete top info" do
    $browser.find_element(:css, "a.delete-overview > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-hasResearchArea > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Remove").click
    browser_accept_alert("Are you sure you want to remove this term?")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Remove").click
    browser_accept_alert("Are you sure you want to remove this term?")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-geographicFocus > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-geographicFocus > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//img[@alt='manage']").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Delete").click
    browser_accept_alert("Are you sure you want to remove this web page?")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Delete").click
    browser_accept_alert("Are you sure you want to remove this web page?")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:id, "returnToIndividual").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Now delete tab stuff one tab at a time" do
  end

  it "Delete Affiliation info" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:css, "a.delete-hasCollaborator > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-hasCollaborator > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-RO_0000053 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Delete Publications info" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:css, "a.delete-RO_0000053 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-featuredIn > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-assigneeFor > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Delete Research info" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    $browser.find_element(:css, "a.delete-researchOverview > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-freetextKeyword > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-freetextKeyword > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Delete Teaching info" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    $browser.find_element(:css, "a.delete-teachingOverview > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-RO_0000053 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Delete Service info" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[10]").click
    $browser.find_element(:css, "a.delete-outreachOverview > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-RO_0000053 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-ERO_0000037 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-RO_0000053 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-ERO_0000397 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-ERO_0000033 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Delete Background info" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    $browser.find_element(:css, "a.delete-relatedBy > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-eligibleFor > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-relatedBy > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-relatedBy > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-RO_0000053 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Delete Contact info" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[14]").click
    $browser.find_element(:css, "li > a.delete-ARG_2000028 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "li > a.delete-ARG_2000028 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "li > a.delete-ARG_2000028 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "li > a.delete-ARG_2000028 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "li > a.delete-ARG_2000028 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Delete Identity info" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[16]").click
    $browser.find_element(:css, "a.delete-orcidId > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-orcidId > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-eRACommonsId > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-eRACommonsId > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-researcherId").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-researcherId > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-scopusId > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-scopusId > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-ARG_0000197 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-ARG_0000197 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify Index stuff" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    expect(browser_page_text).to include("people")
    expect(browser_page_text).to include("Faculty Member (1)")
    expect(browser_page_text).to include("Faculty Member Emeritus (1)")
    expect(browser_page_text).to include("Librarian (1)")
    expect(browser_page_text).to include("Person (5)")
    expect(browser_page_text).to include("activities")
    expect(browser_page_text).to include("Service (1)")
    expect(browser_page_text).to include("Training Service (1)")
    expect(browser_page_text).to include("events")
    expect(browser_page_text).to include("Event (2)")
    expect(browser_page_text).to include("Exhibit (1)")
    expect(browser_page_text).to include("Performance (1)")
    expect(browser_page_text).to include("organizations")
    expect(browser_page_text).to include("Organization (1)")
    expect(browser_page_text).to include("research")
    expect(browser_page_text).to include("Award or Honor (3)")
    expect(browser_page_text).to include("Case Study (1)")
    expect(browser_page_text).to include("Concept (12)")
    expect(browser_page_text).to include("Conference Poster (1)")
    expect(browser_page_text).to include("Credential (4)")
    expect(browser_page_text).to include("License (3)")
    expect(browser_page_text).to include("Newsletter (1)")
    expect(browser_page_text).to include("Patent (2)")
    expect(browser_page_text).to include("Technique (2)")
  end

  it "Delete stuff one section at a time" do
  end

  it "Delete people section--leave Jane and Lily for now" do
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    $browser.find_element(:link_text, "Adams, John").click
    expect($browser.title).to eq("Adams, John")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    $browser.find_element(:link_text, "Adams, Amy").click
    expect($browser.title).to eq("Adams, Amy")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    $browser.find_element(:link_text, "Smith, Joe").click
    expect($browser.title).to eq("Smith, Joe")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Delete activities section" do
    $browser.find_element(:link_text, "Service").click
    expect($browser.title).to eq("Service")
    $browser.find_element(:link_text, "Primate Feeding").click
    expect($browser.title).to eq("Primate Feeding")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Delete events section" do
    $browser.find_element(:link_text, "Event").click
    expect($browser.title).to eq("Event")
    $browser.find_element(:link_text, "Apes on Parade").click
    expect($browser.title).to eq("Apes on Parade")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Event").click
    expect($browser.title).to eq("Event")
    $browser.find_element(:link_text, "Primates of East Africa").click
    expect($browser.title).to eq("Primates of East Africa")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
  end

  it "Delete organizations section" do
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Organization").click
    expect($browser.title).to eq("Organization")
    $browser.find_element(:link_text, "Professional Ape Trainer Association").click
    expect($browser.title).to eq("Professional Ape Trainer Association")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Delete research section" do
    $browser.find_element(:link_text, "Award or Honor").click
    expect($browser.title).to eq("Award or Honor")
    $browser.find_element(:link_text, "Ape Trainer of the Decade").click
    expect($browser.title).to eq("Ape Trainer of the Decade")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Award or Honor").click
    expect($browser.title).to eq("Award or Honor")
    $browser.find_element(:link_text, "Chimp Lover for Life").click
    expect($browser.title).to eq("Chimp Lover for Life")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Award or Honor").click
    expect($browser.title).to eq("Award or Honor")
    $browser.find_element(:link_text, "Monkey Trainer of the Year").click
    expect($browser.title).to eq("Monkey Trainer of the Year")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Case Study").click
    expect($browser.title).to eq("Case Study")
    $browser.find_element(:link_text, "Primate Reactions").click
    expect($browser.title).to eq("Primate Reactions")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Conference Poster").click
    expect($browser.title).to eq("Conference Poster")
    $browser.find_element(:link_text, "Variety of Apes in Africa").click
    expect($browser.title).to eq("Variety of Apes in Africa")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Credential").click
    expect($browser.title).to eq("Credential")
    $browser.find_element(:link_text, "Licensed Primate Expert").click
    expect($browser.title).to eq("Licensed Primate Expert")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Credential").click
    expect($browser.title).to eq("Credential")
    $browser.find_element(:link_text, "Licensed Primate Instructor").click
    expect($browser.title).to eq("Licensed Primate Instructor")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Credential").click
    expect($browser.title).to eq("Credential")
    $browser.find_element(:link_text, "Primate Expert Association").click
    expect($browser.title).to eq("Primate Expert Association")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Credential").click
    expect($browser.title).to eq("Credential")
    $browser.find_element(:link_text, "Primate Experts").click
    expect($browser.title).to eq("Primate Experts")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Newsletter").click
    expect($browser.title).to eq("Newsletter")
    $browser.find_element(:link_text, "Ape Week").click
    expect($browser.title).to eq("Ape Week")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Patent").click
    expect($browser.title).to eq("Patent")
    $browser.find_element(:link_text, "USA1234567890").click
    expect($browser.title).to eq("USA1234567890")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Patent").click
    expect($browser.title).to eq("Patent")
    $browser.find_element(:link_text, "USABC123456789").click
    expect($browser.title).to eq("USABC123456789")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Concept").click
    expect($browser.title).to eq("Concept")
    $browser.find_element(:link_text, "African Primates").click
    expect($browser.title).to eq("African Primates")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Concept").click
    expect($browser.title).to eq("Concept")
    $browser.find_element(:link_text, "Primate Feeding").click
    expect($browser.title).to eq("Primate Feeding")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Concept").click
    expect($browser.title).to eq("Concept")
    $browser.find_element(:link_text, "Primates-R-Us Fellowship").click
    expect($browser.title).to eq("Primates-R-Us Fellowship")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Concept").click
    expect($browser.title).to eq("Concept")
    $browser.find_element(:link_text, "Primatia").click
    expect($browser.title).to eq("Primatia")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Concept").click
    expect($browser.title).to eq("Concept")
    $browser.find_element(:link_text, "Primatia Africana").click
    expect($browser.title).to eq("Primatia Africana")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Technique").click
    expect($browser.title).to eq("Technique")
    $browser.find_element(:link_text, "JF Feeding").click
    expect($browser.title).to eq("JF Feeding")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Technique").click
    expect($browser.title).to eq("Technique")
    $browser.find_element(:link_text, "JF Feeding Revised").click
    expect($browser.title).to eq("JF Feeding Revised")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "County").click
    expect($browser.title).to eq("County")
    $browser.find_element(:link_text, "Mozamia").click
    expect($browser.title).to eq("Mozamia")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Verify deletions and remainders" do
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    #<tr><td>refresh</td><td></td><td></td></tr>
    expect(browser_page_text).to include("people")
    expect(browser_page_text).to include("Faculty Member (1)")
    expect(browser_page_text).not_to include("Faculty Member Emeritus (1)")
    expect(browser_page_text).to include("Librarian (1)")
    expect(browser_page_text).to include("Person (2)")
    expect(browser_page_text).not_to include("activities")
    expect(browser_page_text).not_to include("events")
    expect(browser_page_text).not_to include("organizations")
    expect(browser_page_text).not_to include("County (1)")
    expect(browser_page_text).to include("locations")
  end

  it "Had to remove following code because of Research menu" do
  end

  it "verifyTextNotPresent research" do
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
