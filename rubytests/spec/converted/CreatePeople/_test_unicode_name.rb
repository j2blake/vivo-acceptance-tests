shared_examples "Create People: Test Unicode Name" do
  it "Add a Faculty member with a name containing unicode" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    expect(browser_page_text).to include("Data Input")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
  end

  it "Validate adding individual" do
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("VIVO Site Administration")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member (vivo)")
    $browser.find_element(:xpath, ".//input[@value='Add individual of this class']").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Mary")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Marienkäfer")
    $browser.find_element(:id, "submit").click
  end

  it "Verify that faculty member was created" do
    expect(browser_page_text).to include("Marienkäfer, Mary")
    expect(browser_page_text).to include("Faculty Member")
  end

  it "Search for new faculty member with umlauts" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("Marienkäfer")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    expect($browser.title).to eq("Search for 'Marienkäfer'")
    expect(browser_page_text).to include("Search results for 'Marienkäfer'")
    $browser.find_element(:link_text, "Marienkäfer, Mary")
    expect(browser_page_text).to include("Marienkäfer, Mary Faculty Member")
  end

  it "Search for new faculty member without umlauts" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("Marienkafer")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    expect($browser.title).to eq("Search for 'Marienkafer'")
    expect(browser_page_text).to include("Search results for 'Marienkafer'")
    $browser.find_element(:link_text, "Marienkäfer, Mary")
    expect(browser_page_text).to include("Marienkäfer, Mary Faculty Member")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
