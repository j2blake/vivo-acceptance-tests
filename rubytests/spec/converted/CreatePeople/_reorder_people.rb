shared_examples "Create People: Reorder People" do
  it "Add people and reorder them" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Add 4 people" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    expect(browser_page_text).to include("Data Input")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Jeff")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Adams")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Adams, Jeff")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Jane")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Doe")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Doe, Jane")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Librarian (vivo)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("John")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Smith")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Smith, John")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Person (foaf)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Susie")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Booth")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Booth, Susie")
  end

  it "Add all people as Susie's collaborators" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
    $browser.find_element(:css, "a.add-hasCollaborator > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("adam")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Booth, Susie")
    $browser.find_element(:css, "a.add-hasCollaborator > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("doe")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Booth, Susie")
    $browser.find_element(:css, "a.add-hasCollaborator > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "object").send_keys("smith")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Booth, Susie")
  end

  it "Verify order is ascending" do
    $browser.find_element(:css, "#hasCollaborator-Person-List > li")
    $browser.find_element(:xpath, ".//ul[@id='hasCollaborator-Person-List']/li[2]")
    $browser.find_element(:xpath, ".//ul[@id='hasCollaborator-Person-List']/li[3]")
  end

  it "Turn on verbose & update object property" do
    $browser.find_element(:id, "verbosePropertySwitch").click
    expect($browser.title).to eq("Booth, Susie")
    $browser.find_element(:link_text, "vivo:hasCollaborator").click
    expect($browser.title).to eq("Object Property Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit Property Record']").click
    expect($browser.title).to eq("Property Editing Form")
    $browser.find_element(:name, "DomainEntitySortDirection").clear
    $browser.find_element(:name, "DomainEntitySortDirection").send_keys("desc")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Object Property Control Panel")
  end

  it "Verify order is descending" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    $browser.find_element(:link_text, "Booth, Susie").click
    $browser.find_element(:id, "verbosePropertySwitch").click
    expect($browser.title).to eq("Booth, Susie")
    $browser.find_element(:css, "#hasCollaborator-Person-List > li")
    $browser.find_element(:xpath, ".//ul[@id='hasCollaborator-Person-List']/li[2]")
    $browser.find_element(:xpath, ".//ul[@id='hasCollaborator-Person-List']/li[3]")
  end

  it "Change order back to ascending" do
    $browser.find_element(:id, "verbosePropertySwitch").click
    expect($browser.title).to eq("Booth, Susie")
    $browser.find_element(:link_text, "vivo:hasCollaborator").click
    expect($browser.title).to eq("Object Property Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit Property Record']").click
    expect($browser.title).to eq("Property Editing Form")
    $browser.find_element(:name, "DomainEntitySortDirection").clear
    $browser.find_element(:name, "DomainEntitySortDirection").send_keys("")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Object Property Control Panel")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    $browser.find_element(:link_text, "Booth, Susie").click
    expect($browser.title).to eq("Booth, Susie")
    $browser.find_element(:id, "verbosePropertySwitch").click
    expect($browser.title).to eq("Booth, Susie")
  end

  it "Verify order is ascending again" do
    $browser.find_element(:css, "#hasCollaborator-Person-List > li")
    $browser.find_element(:xpath, ".//ul[@id='hasCollaborator-Person-List']/li[2]")
    $browser.find_element(:xpath, ".//ul[@id='hasCollaborator-Person-List']/li[3]")
  end

  it "Delete test people" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    $browser.find_element(:link_text, "Adams, Jeff").click
    expect($browser.title).to eq("Adams, Jeff")
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
    $browser.find_element(:link_text, "Doe, Jane").click
    expect($browser.title).to eq("Doe, Jane")
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
    $browser.find_element(:link_text, "Smith, John").click
    expect($browser.title).to eq("Smith, John")
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
    $browser.find_element(:link_text, "Booth, Susie").click
    expect($browser.title).to eq("Booth, Susie")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    #<tr><td>waitForPageToLoad</td><td>5000</td><td></td></tr>
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
