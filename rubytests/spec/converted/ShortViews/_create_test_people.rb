shared_examples "Short Views: Create Test People" do
  it "Add five test people" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Add faculty Able Baker with a preferred title" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member (vivo)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Able")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Baker")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Baker, Able")
    $browser.find_element(:css, "[title=\"Add new preferred title entry\"]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "preferredTitle").clear
    $browser.find_element(:id, "preferredTitle").send_keys("Professor")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Baker, Able")
  end

  it "Add faculty Charlie Dog as a member of Department A" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member (vivo)")
    $browser.find_element(:id, "submit").click
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Charlie")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Dog")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Dog, Charlie")
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:css, "a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Academic Department")
  end

  it "Select Department A" do
    $browser.find_element(:id, "activity").send_keys("Depart")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Member")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Dog, Charlie")
  end

  it "Add faculty Echo Foxtrot as the head of Department B" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member (vivo)")
    $browser.find_element(:id, "submit").click
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Echo")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Foxtrot")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Foxtrot, Echo")
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:css, "a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Department")
  end

  it "Select Department B" do
    $browser.find_element(:id, "activity").send_keys("Department B")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Head")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Foxtrot, Echo")
  end

  it "Add faculty George Henry" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member (vivo)")
    $browser.find_element(:id, "submit").click
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("George")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Henry")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Henry, George")
  end

  it "Add person Iris Jenkins" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Person (foaf)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Iris")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Jenkins")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Jenkins, Iris")
  end

  it "Verify all people exist" do
    $browser.find_element(:link_text, "Index").click
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    expect($browser.title).to eq("Index of Contents")
    expect(browser_page_text).to include("Faculty Member (4)")
    $browser.find_element(:link_text, "Faculty Member")
    expect(browser_page_text).to include("Person (5)")
    $browser.find_element(:link_text, "Person")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    expect(browser_page_text).to include("Faculty Member")
    expect(browser_page_text).to include("Baker, Able Professor")
    $browser.find_element(:link_text, "Baker, Able")
    expect(browser_page_text).to include("Dog, Charlie Member of Department A")
    $browser.find_element(:link_text, "Dog, Charlie")
    expect(browser_page_text).to include("Foxtrot, Echo Member of Department B")
    $browser.find_element(:link_text, "Foxtrot, Echo")
    expect(browser_page_text).to include("Henry, George")
    $browser.find_element(:link_text, "Henry, George")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    expect(browser_page_text).to include("Person")
    expect(browser_page_text).to include("Baker, Able Professor")
    $browser.find_element(:link_text, "Baker, Able")
    expect(browser_page_text).to include("Dog, Charlie Faculty Member Member of Department A")
    $browser.find_element(:link_text, "Dog, Charlie")
    expect(browser_page_text).to include("Foxtrot, Echo Faculty Member Member of Department B")
    $browser.find_element(:link_text, "Foxtrot, Echo")
    expect(browser_page_text).to include("Henry, George Faculty Member")
    $browser.find_element(:link_text, "Henry, George")
    expect(browser_page_text).to include("Jenkins, Iris")
    $browser.find_element(:link_text, "Jenkins, Iris")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
