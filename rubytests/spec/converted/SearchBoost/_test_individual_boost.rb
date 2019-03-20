shared_examples "Search Boost: Test Individual Boost" do
  it "***Before running this test***" do
  end

  it "***must update BoostIndividual.txt***" do
  end

  it "***to identify the correct individual***" do
  end

  it "Test individual boost" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Check current search results" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("faculty")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("Search for 'faculty'")
    expect(browser_page_text).to include("Baker, Able Faculty Member")
    expect(browser_page_text).to include("Dog, Charlie Faculty Member")
    expect(browser_page_text).to include("Foxtrot, Echo Faculty Member")
    expect(browser_page_text).to include("Henry, George Faculty Member")
    expect(browser_page_text).to include("Jenkins, Iris Faculty Member Emeritus")
  end

  it "Make sure Foxtrot is in middle of search results" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "Change range of Echo Foxtrot" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Add/Remove RDF data").click
    expect($browser.title).to eq("Ingest RDF Data")
    $browser.find_element(:name, "rdfStream").clear
    $browser.find_element(:name, "rdfStream").send_keys(tester_filepath("BoostIndividual.txt", __FILE__))
    browser_find_select_list(:name, "language").select_by(:text, "N3")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Ingest RDF Data")
    expect(browser_page_text).to include("RDF upload successful.")
  end

  it "Search again--Echo should be on top" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("faculty")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("Search for 'faculty'")
    expect(browser_page_text).to include("Foxtrot, Echo Faculty Member")
    expect(browser_page_text).to include("Baker, Able Faculty Member")
    expect(browser_page_text).to include("Dog, Charlie Faculty Member")
    expect(browser_page_text).to include("Henry, George Faculty Member")
    expect(browser_page_text).to include("Jenkins, Iris Faculty Member Emeritus")
  end

  it "Foxtrot should now be first" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "Now remove individual boosting" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Add/Remove RDF data").click
    expect($browser.title).to eq("Ingest RDF Data")
    $browser.find_element(:name, "rdfStream").clear
    $browser.find_element(:name, "rdfStream").send_keys(tester_filepath("BoostIndividual.txt", __FILE__))
    browser_find_select_list(:name, "language").select_by(:text, "N3")
    $browser.find_element(:xpath, "(.//input[@name='mode'])[3]").click
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Ingest RDF Data")
    expect(browser_page_text).to include("Removed RDF from file BoostIndividual.txt. Removed 1 statements.")
  end

  it "Make sure search is back to normal--as of 1.8 this means at the end" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("faculty")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("Search for 'faculty'")
    expect(browser_page_text).to include("Baker, Able Faculty Member")
    expect(browser_page_text).to include("Dog, Charlie Faculty Member")
    expect(browser_page_text).to include("Foxtrot, Echo Faculty Member")
    expect(browser_page_text).to include("Henry, George Faculty Member")
    expect(browser_page_text).to include("Jenkins, Iris Faculty Member Emeritus")
  end

  it "Foxtrot should be back in the middle" do
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
