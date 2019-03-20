shared_examples "Open Social Gadgets: Check Gadgets" do
  it "Check open social gadgets" do
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

  it "Verify gadgets appear" do
  end

  it "IF ANY GADGETS APPEAR THE TEST IS PASSED!" do
    $browser.find_element(:link_text, "Hello RDF!")
    $browser.find_element(:link_text, "Websites")
    $browser.find_element(:link_text, "Tweets")
    $browser.find_element(:link_text, "Featured Presentations")
  end

  it "Search for Frank" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("frank")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("Search for 'frank'")
    $browser.find_element(:link_text, "Furter, Frank")
    expect(browser_page_text).to include("Furter, Frank Faculty Member")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
  end

  it "Verify gadgets appear" do
    expect(browser_page_text).to include("OpenSocial")
    expect($browser.find_element(:id, "remote_iframe_0_title").text).to eq("Google site search: full text search results XX")
    #<tr><td>selectFrame</td><td>remote_iframe_0</td><td></td></tr>
    expect($browser.find_element(:id, "content").text).to eq("Additional search results for frank")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
