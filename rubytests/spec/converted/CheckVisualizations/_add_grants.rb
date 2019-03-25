shared_examples "Check Visualizations: Add Grants" do
  it "Add Grants" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Add first grant" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    $browser.find_element(:css, "#researchGroup > article.property > #RO_0000053 > a.add-RO_0000053 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "grant").clear
    $browser.find_element(:id, "grant").send_keys("Games and Kids: The Impact")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2002")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2004")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Add second grant" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[22]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "grant").clear
    $browser.find_element(:id, "grant").send_keys("Childhood Development in the 21st Century")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2006")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Add third grant" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[23]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "grant").clear
    $browser.find_element(:id, "grant").send_keys("Future of Children")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2007")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("2008")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Add fourth grant" do
    $browser.find_element(:xpath, "(.//img[@alt='add'])[23]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "grant").clear
    $browser.find_element(:id, "grant").send_keys("Nix Nintendo?")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Verify Network Display" do
    $browser.find_element(:link_text, "Co-investigator Network")
    $browser.find_element(:link_text, "Co-investigator Network").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("Furter, Frank - Person Level Visualization")
    $browser.find_element(:id, "ego_label")
    $browser.find_element(:link_text, "Co-author Network")
    expect(browser_page_text).to include("Co-investigator Network")
    $browser.find_element(:link_text, "(GraphML File)")
    expect(browser_page_text).to include("4 grants")
    expect(browser_page_text).to include("from 2002 through 2018")
    $browser.find_element(:link_text, "(.CSV File)")
    expect(browser_page_text).to include("0 co-investigators")
    expect(browser_page_text).to include("from 2009 through 2018")
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
    expect(browser_page_text).to include("1")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
