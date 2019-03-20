shared_examples "Check Visualizations: Add Co Investigators" do
  it "Add co-investigators to grants" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Do not add co-investigators to Games and Kids grant" do
  end

  it "Do not add co-investigators to Child Development grant" do
  end

  it "Add 1 co-investigator to Future of Children grant" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    $browser.find_element(:link_text, "Zink, Zoe").click
    expect($browser.title).to eq("Zink, Zoe")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[23]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "grant").send_keys("Future of")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2007")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2008")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Zink, Zoe")
  end

  it "Add 2 co-investigators to Nix Nintendo grant" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    $browser.find_element(:link_text, "Zink, Zoe").click
    expect($browser.title).to eq("Zink, Zoe")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[23]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "grant").send_keys("Nix N")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Zink, Zoe")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    $browser.find_element(:link_text, "Johnson, Jane").click
    expect($browser.title).to eq("Johnson, Jane")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[23]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "grant").send_keys("Nix N")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Johnson, Jane")
  end

  it "Verify co-investigator network is correct" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Co-investigator Network").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("Furter, Frank - Person Level Visualization")
    $browser.find_element(:id, "ego_label")
    expect(browser_page_text).to include("Co-investigator Network")
    $browser.find_element(:link_text, "(GraphML File)")
    expect(browser_page_text).to include("VIVO profile")
    $browser.find_element(:id, "profileUrl")
    expect(browser_page_text).to include("4   Grant(s)")
    expect(browser_page_text).to include("2   Co-investigator(s)")
    expect(browser_page_text).to include("2002  First Grant")
    expect(browser_page_text).to include("2010   Last Grant")
    expect(browser_page_text).to include("4 grants")
    expect(browser_page_text).to include("from 2002 through 2014")
    $browser.find_element(:link_text, "(.CSV File)")
    expect(browser_page_text).to include("2 co-investigators")
    expect(browser_page_text).to include("from 2002 through 2014")
    $browser.find_element(:css, "a[title=\"csv File\"]")
    expect(browser_page_text).to include("Tables")
    expect(browser_page_text).to include("The information in the following tables is for all years.")
    expect(browser_page_text).to include("Grants per year")
    $browser.find_element(:css, "caption > a")
    expect(browser_page_text).to include("2002")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("2006")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("2007")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("2010")
    expect(browser_page_text).to include("Co-investigators")
    $browser.find_element(:css, "#coinvestigations_table > caption > a")
    expect(browser_page_text).to include("Grants with")
    expect(browser_page_text).to include("Furter, Frank")
    expect(browser_page_text).to include("Zink, Zoe")
    expect(browser_page_text).to include("2")
    expect(browser_page_text).to include("Johnson, Jane")
    expect(browser_page_text).to include("1")
  end

  it "Verify co-author network still o.k." do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Co-author Network").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("Furter, Frank - Person Level Visualization")
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
    expect(browser_page_text).to include("Co-authors")
    $browser.find_element(:css, "#coauthorships_table > caption > a")
    expect(browser_page_text).to include("Author")
    expect(browser_page_text).to include("Publications with")
    expect(browser_page_text).to include("Furter, Frank")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("Smith, Sally")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("Zink, Zoe")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("Johnson, Jane")
    expect(browser_page_text).to include("1")
  end

  it "Check for link back to Co-Investigator Network" do
    $browser.find_element(:link_text, "Co-investigator Network")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
