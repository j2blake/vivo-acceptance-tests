shared_examples "Create a Librarian" do
  it "logs in as Admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "decides to add a librarian" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")

    $browser.find_element(:id, "VClassURI")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Librarian (vivo)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create a new Librarian")
  end

  it "creates with the basic info" do
    $browser.find_element(:id, "firstName").send_keys("Lily")
    $browser.find_element(:id, "middleName").send_keys("Lou")
    $browser.find_element(:id, "lastName").send_keys("Librarian")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "adds a preferred title" do
    $browser.find_element(:css, "#preferredTitle a").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("preferred title for")

    $browser.find_element(:id, "preferredTitle").send_keys("Assistant Librarian")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Librarian, Lily Lou")

    expect(browser_page_text).to include("Librarian, Lily Lou")
    expect(browser_page_text).to include("Assistant Librarian")
  end

  it "finds the librarian and the faculty member in the index" do
    vivo_wait_for_indexing

    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")

    $browser.find_element(:link_text, "Faculty Member")
    expect(browser_page_text).to include("Faculty Member (1)")
    $browser.find_element(:link_text, "Librarian")
    expect(browser_page_text).to include("Librarian (1)")
    $browser.find_element(:link_text, "Person")
    expect(browser_page_text).to include("Person (2)")
  end

  it "inspects the index of librarians" do
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")

    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Librarian, Lily Lou Assistant Librarian")
  end

  it "searches for the librarian" do
    $browser.find_element(:name, "querytext").send_keys("librarian")
    $browser.find_element(:css, "#search-field > input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'librarian'")

    expect(browser_page_text).to include("Search results for 'librarian'")
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Librarian, Lily Lou Assistant Librarian")
  end

  it "follows the home page link to People browsing page" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")

    browser_wait_for_jQuery
    expect(browser_page_text).to include("No research content found.")
    $browser.find_element(:link_text, "View all ...").click
    expect($browser.title).to eq("People")

    $browser.find_element(:link_text, "Person (2)").click
  end

  it "examines the entries for the librarian and the faculty member" do
    browser_wait_for_jQuery
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Associate Professor")

    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Assistant Librarian")
  end

  it "logs out" do
    vivo_logout
  end
end
