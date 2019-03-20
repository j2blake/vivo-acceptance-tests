shared_examples "Linked Open Data: Check Data Hiding" do
  it "Check for proper data hiding" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "---" do
  end

  it "Check that ScopusID is not publicly visible but eRACommonsID is" do
    #<tr><td>open</td><td>/testApp/TestLinkedOpenData.html</td><td></td></tr>
    $browser.find_element(:id, "N3_EXTENSION_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("vivo:eRACommonsId")
    expect(browser_page_text).not_to include("vivo:scopusId")
  end

  it "---" do
  end

  it "Log in as Editor, Curator or Admin	" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
  end

  it "---" do
  end

  it "Check that ScopusID and eRACommonsID are visible for admin" do
    #<tr><td>open</td><td>/testApp/TestLinkedOpenData.html</td><td></td></tr>
    $browser.find_element(:id, "N3_EXTENSION_button").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("vivo:eRACommonsId")
    expect(browser_page_text).to include("vivo:scopusId")
  end

  it "---" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
    vivo_logout
    end
  end
