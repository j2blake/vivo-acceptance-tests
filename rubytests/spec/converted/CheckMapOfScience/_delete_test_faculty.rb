shared_examples "Check Map Of Science: Delete Test Faculty" do
  it "Delete test faculty members" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to index" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Verify person to be deleted is there" do
    expect(browser_page_text).to include("people")
    expect(browser_page_text).to include("Faculty Member")
    expect(browser_page_text).to include("Person")
  end

  it "Navigate to faculty member" do
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Delete faculty member" do
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Verify both faculty members are gone" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    expect(browser_page_text).not_to include("people")
    expect(browser_page_text).not_to include("Faculty Member")
    expect(browser_page_text).not_to include("Person")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
