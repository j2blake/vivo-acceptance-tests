shared_examples "Check Visualizations: Add Co Authors" do
  it "Add co-authors to publications" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Add 1 co-author for book" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Book").click
    expect($browser.title).to eq("Book")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?").click
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:css, "a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Smith")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Sally")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
  end

  it "Add 2 co-authors  for article" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Academic Article").click
    expect($browser.title).to eq("Academic Article")
    $browser.find_element(:link_text, "Why Games Are Important to Child Growth").click
    expect($browser.title).to eq("Why Games Are Important to Child Growth")
    $browser.find_element(:css, "a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Johnson")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Jane")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "returnLink").click
    expect($browser.title).to eq("Why Games Are Important to Child Growth")
    $browser.find_element(:css, "a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Zink")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Zoe")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
  end

  it "Add no co-author(s) for chapter" do
  end

  it "Add no co-author(s) for conference" do
  end

  it "Verify co-authors reflected properly" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("Furter, Frank")
    expect(browser_page_text).to include("Publications in VIVO")
    expect(browser_page_text).to include("2 in the last 10 full")
    $browser.find_element(:link_text, "Co-author Network")
    $browser.find_element(:link_text, "Map of Science")
    expect($browser.find_elements(:link_text, "Co-Investigator Network").size).to eq(0)
    $browser.find_element(:link_text, "Co-author Network").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("Furter, Frank - Person Level Visualization")
    expect(browser_page_text).to include("Furter, Frank")
    $browser.find_element(:id, "ego_label")
    expect(browser_page_text).to include("Co-author Network")
    $browser.find_element(:link_text, "GraphML file")
    expect(browser_page_text).to include("VIVO profile")
    $browser.find_element(:id, "profileUrl")
    expect(browser_page_text).to include("4   Publications through today's date")
    expect(browser_page_text).to include("3   Co-author(s)")
    expect(browser_page_text).to include("2001  First publication")
    expect(browser_page_text).to include("2009   Last publication")
    expect(browser_page_text).to include("4 publications")
    expect(browser_page_text).to include("from 2001 - 2014")
    $browser.find_element(:link_text, "(.CSV File)")
    expect(browser_page_text).to include("3 co-authors")
    expect(browser_page_text).to include("from 2001 - 2014")
    $browser.find_element(:css, "a[title=\"csv File\"]")
    expect(browser_page_text).to include("Tables")
    expect(browser_page_text).to include("Publications per year")
    $browser.find_element(:css, "caption > a")
    expect(browser_page_text).to include("Year")
    expect(browser_page_text).to include("Publications")
    expect(browser_page_text).to include("2001")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("2003")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("2005")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("2009")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("Co-authors")
    $browser.find_element(:css, "#coauthorships_table > caption > a")
    expect(browser_page_text).to include("Author")
    expect(browser_page_text).to include("Publications with")
    expect(browser_page_text).to include("Furter, Frank")
    expect(browser_page_text).to include("Smith, Sally")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("Zink, Zoe")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("Johnson, Jane")
    expect(browser_page_text).to include("1")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
