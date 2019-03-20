shared_examples "Create People: Associate Lib To Fac" do
  it "Associate Librarians to Faculty" do
  end

  it "Must not be logged in" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to the core:Librarian in the ontology" do
    $browser.find_element(:link_text, "Class hierarchy").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Asserted Class Hierarchy")
    #<tr><td>selectAndWait</td><td>id=displayOption</td><td>label=All Classes</td></tr>
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Librarian (vivo)")
    $browser.find_element(:link_text, "Librarian (vivo)").click
    expect($browser.title).to eq("Class Control Panel")
    $browser.find_element(:xpath, ".//input[@value='New Link to Superclass']").click
    expect($browser.title).to eq("Super/Subclass Editing Form")
  end

  it "Create the link" do
    browser_find_select_list(:name, "SuperclassURI").select_by(:text, "Faculty Member (vivo)")
    browser_find_select_list(:name, "SubclassURI").select_by(:text, "Librarian (vivo)")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Class Control Panel")
  end

  it "Make sure Lilly Librarian shows up in both categories" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    #<tr><td>refresh</td><td></td><td></td></tr>
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Assistant Librarian")
    $browser.find_element(:link_text, "People").click
    expect($browser.title).to eq("People")
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    $browser.find_element(:link_text, "Faculty Member (2)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("People")
    expect(browser_page_text).to include("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor")
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Assistant Librarian")
    $browser.find_element(:link_text, "Librarian (1)").click
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Assistant Librarian")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    expect(browser_page_text).to include("Faculty Member (2)")
    expect(browser_page_text).to include("Librarian (1)")
    expect(browser_page_text).to include("Person (2)")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
