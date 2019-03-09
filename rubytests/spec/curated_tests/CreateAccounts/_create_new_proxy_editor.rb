shared_examples "Create Accounts: Create New Proxy Editor" do
  it "Create Librarian person" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to add new individual page" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Person (foaf)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect(browser_page_text).to include("Create a new Person")
  end

  it "Create a librarian individual" do
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Paula")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Proxy")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Proxy, Paula")
  end

  it "Make individual an Assistant Librarian" do
    $browser.find_element(:css, "a.add-preferredTitle > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("Administrative Assistant")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Proxy, Paula")
    # #<tr><td>pause</td><td>50000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
  end

  it "Verify that librarian was added sucessfully" do
    expect(browser_page_text).to include("Proxy, Paula")
    expect(browser_page_text).to include("Administrative Assistant")
  end

  it "Browse for new librarian" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Person")
    expect(browser_page_text).to include("Person (1)")
    $browser.find_element(:link_text, "Person")
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    $browser.find_element(:link_text, "Proxy, Paula")
    expect(browser_page_text).to include("Proxy, Paula Administrative Assistant")
  end

  it "Search for new librarian" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("administrative")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    expect($browser.title).to eq("Search for 'administrative'")
    expect(browser_page_text).to include("Search results for 'administrative'")
    $browser.find_element(:link_text, "Proxy, Paula")
    expect(browser_page_text).to include("Proxy, Paula Administrative Assistant")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
