shared_examples "Search Exclusion: Delete Test Faculty Member" do
  it "Delete test person Jane Faculty" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:link_text, "Edit this individual").click
  end

  it "Delete Jane Faculty" do
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
#    $browser.find_element(:link_text, "Rebuild search index").click
#    expect($browser.title).to eq("Rebuild Search Index")
#    $browser.find_element(:name, "rebuild").click
#    expect($browser.title).to eq("Rebuild Search Index")
#    #<tr><td>waitForTextPresent</td><td>Reset the search index and re-populate it.</td><td></td></tr>
  end

  it "Verify that Jane Faculty is indeed gone" do
    vivo_wait_for_indexing
    $browser.find_element(:link_text, "Index").click
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
    expect(browser_page_text).not_to include("Faculty Member")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
