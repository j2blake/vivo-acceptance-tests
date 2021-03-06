shared_examples "Search Boost: Create Test People" do
  it "Add five test people" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Add faculty Able Baker" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member (vivo)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Able")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Baker")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Baker, Able")
  end

  it "Add faculty Charlie Dog" do
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
  end

  it "Add faculty Echo Foxtrot " do
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
  end

  it "During pause get n#### for next step" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
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

  it "Add emeritus Iris Jenkins" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member Emeritus (vivo)")
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
    expect(browser_page_text).to include("Faculty Member Emeritus (1)")
    expect(browser_page_text).to include("Person (5)")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
