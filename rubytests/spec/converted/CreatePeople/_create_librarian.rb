shared_examples "Create People: Create Librarian" do
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
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Librarian (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect(browser_page_text).to include("Create a new Librarian")
  end

  it "Create a librarian individual" do
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Lily")
    $browser.find_element(:id, "middleName").clear
    $browser.find_element(:id, "middleName").send_keys("Lou")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Librarian")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "Make individual an Assistant Librarian" do
    $browser.find_element(:css, "[title=\"Add new preferred title entry\"]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "preferredTitle").clear
    $browser.find_element(:id, "preferredTitle").send_keys("Assistant Librarian")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Librarian, Lily Lou")
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "Verify that librarian was added sucessfully" do
    expect(browser_page_text).to include("Librarian, Lily Lou")
    expect(browser_page_text).to include("Assistant Librarian")
  end

  it "Browse for new librarian" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member")
    expect(browser_page_text).to include("Faculty Member (1)")
    $browser.find_element(:link_text, "Librarian")
    expect(browser_page_text).to include("Librarian (1)")
    $browser.find_element(:link_text, "Person")
    expect(browser_page_text).to include("Person (2)")
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Librarian, Lily Lou Assistant Librarian")
  end

  it "Search for new librarian" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("librarian")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'librarian'")
    expect(browser_page_text).to include("Search results for 'librarian'")
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Librarian, Lily Lou Assistant Librarian")
  end

  it "Verify front page updated" do
    $browser.find_element(:link_text, "Home").click
    vivo_wait_for_indexing
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("No research content found.")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Faculty, Jane")
    $browser.find_element(:link_text, "View all ...")
    $browser.find_element(:link_text, "View all ...").click
    expect($browser.title).to eq("People")
    $browser.find_element(:link_text, "Person (2)").click
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor")
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Assistant Librarian")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
