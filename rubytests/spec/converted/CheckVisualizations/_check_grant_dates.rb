shared_examples "Check Visualizations: Check Grant Dates" do
  it "Test grant dates are used if no role dates" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Change the dates on the 4 grants" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Grant").click
    expect($browser.title).to eq("Grant")
    $browser.find_element(:link_text, "Childhood Development in the 21st Century").click
    expect($browser.title).to eq("Childhood Development in the 21st Century")
    $browser.find_element(:xpath, ".//h3[@id='dateTimeInterval']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2005")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Childhood Development in the 21st Century")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Grant").click
    expect($browser.title).to eq("Grant")
    $browser.find_element(:link_text, "Future of Children").click
    expect($browser.title).to eq("Future of Children")
    $browser.find_element(:xpath, ".//h3[@id='dateTimeInterval']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2005")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Future of Children")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Grant").click
    expect($browser.title).to eq("Grant")
    $browser.find_element(:link_text, "Games and Kids: The Impact").click
    expect($browser.title).to eq("Games and Kids: The Impact")
    $browser.find_element(:xpath, ".//h3[@id='dateTimeInterval']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2011")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Games and Kids: The Impact")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Grant").click
    expect($browser.title).to eq("Grant")
    $browser.find_element(:link_text, "Nix Nintendo?").click
    expect($browser.title).to eq("Nix Nintendo?")
    $browser.find_element(:xpath, ".//h3[@id='dateTimeInterval']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("2011")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nix Nintendo?")
  end

  it "Verify role dates are still being used (not new grant dates)" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Co-investigator Network").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("Furter, Frank - Person Level Visualization")
    expect(browser_page_text).to include("Furter, Frank")
    $browser.find_element(:id, "ego_label")
    expect(browser_page_text).to include("Co-investigator Network")
    $browser.find_element(:link_text, "(GraphML File)")
    expect(browser_page_text).to include("VIVO profile")
    $browser.find_element(:id, "profileUrl")
    expect(browser_page_text).to include("4   Grant(s)")
    expect(browser_page_text).to include("2   Co-investigator(s)")
    expect(browser_page_text).to include("2005  First Grant")
    expect(browser_page_text).to include("2011   Last Grant")
    $browser.find_element(:link_text, "Co-author Network")
    expect(browser_page_text).to include("4 grants")
    expect(browser_page_text).to include("from 2005 through 2014")
    $browser.find_element(:link_text, "(.CSV File)")
    expect(browser_page_text).to include("2 co-investigators")
    expect(browser_page_text).to include("from 2005 through 2014")
    $browser.find_element(:css, "a[title=\"csv File\"]")
    expect(browser_page_text).to include("Tables")
    expect(browser_page_text).to include("The information in the following tables is for all years.")
    expect(browser_page_text).to include("Grants per year")
    expect(browser_page_text).to include("2005")
    expect(browser_page_text).to include("2")
    expect(browser_page_text).to include("2010")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("2011")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("Co-investigators")
    $browser.find_element(:css, "#coinvestigations_table > caption > a")
    expect(browser_page_text).to include("Investigator")
    expect(browser_page_text).to include("Grants with")
    expect(browser_page_text).to include("Furter, Frank")
    expect(browser_page_text).to include("Zink, Zoe")
    expect(browser_page_text).to include("2")
    expect(browser_page_text).to include("Johnson, Jane")
    expect(browser_page_text).to include("1")
  end

  it "Remove role dates from grants from Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:css, "a.edit-RO_0000053 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:css, "a.edit-RO_0000053 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:css, "#RO_0000053-CoPrincipalInvestigatorRole-List > li > a.edit-RO_0000053 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:css, "#RO_0000053-InvestigatorRole-List > li > a.edit-RO_0000053 > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "startField-year").clear
    $browser.find_element(:id, "startField-year").send_keys("")
    $browser.find_element(:id, "endField-year").clear
    $browser.find_element(:id, "endField-year").send_keys("")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Verify grants display properly" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    expect(browser_page_text).to include("Games and Kids: The Impact 2011 -")
    $browser.find_element(:link_text, "Games and Kids: The Impact")
    expect($browser.find_element(:css, "#RO_0000053-InvestigatorRole-List > li").text).to eq("exact:Nix Nintendo? 2010 -")
    $browser.find_element(:link_text, "Nix Nintendo?")
    expect(browser_page_text).to include("Future of Children 2005 -")
    $browser.find_element(:link_text, "Future of Children")
    expect(browser_page_text).to include("Childhood Development in the 21st Century 2005 -")
    $browser.find_element(:link_text, "Childhood Development in the 21st Century")
  end

  it "Verify grants dates are being used (since there are no role dates)" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Co-investigator Network").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("Furter, Frank - Person Level Visualization")
    expect(browser_page_text).to include("Furter, Frank")
    $browser.find_element(:id, "ego_label")
    expect(browser_page_text).to include("Co-investigator Network")
    $browser.find_element(:link_text, "(GraphML File)")
    expect(browser_page_text).to include("VIVO profile")
    $browser.find_element(:id, "profileUrl")
    $browser.find_element(:link_text, "Co-author Network")
    expect(browser_page_text).to include("4   Grant(s)")
    expect(browser_page_text).to include("2   Co-investigator(s)")
    expect(browser_page_text).to include("2005  First Grant")
    expect(browser_page_text).to include("2011   Last Grant")
    expect(browser_page_text).to include("4 grants")
    expect(browser_page_text).to include("from 2005 through 2014")
    $browser.find_element(:link_text, "(.CSV File)")
    expect(browser_page_text).to include("2 co-investigators")
    expect(browser_page_text).to include("from 2005 through 2014")
    $browser.find_element(:css, "a[title=\"csv File\"]")
    expect(browser_page_text).to include("Tables")
    expect(browser_page_text).to include("The information in the following tables is for all years.")
    expect(browser_page_text).to include("Grants per year")
    $browser.find_element(:css, "caption > a")
    expect(browser_page_text).to include("2005")
    expect(browser_page_text).to include("2")
    expect(browser_page_text).to include("2011")
    expect(browser_page_text).to include("2")
    expect(browser_page_text).to include("Co-investigators")
    $browser.find_element(:css, "#coinvestigations_table > caption > a")
    expect(browser_page_text).to include("Investigator")
    expect(browser_page_text).to include("Grants with")
    expect(browser_page_text).to include("Furter, Frank")
    expect(browser_page_text).to include("Zink, Zoe")
    expect(browser_page_text).to include("2")
    expect(browser_page_text).to include("Johnson, Jane")
    expect(browser_page_text).to include("1")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
