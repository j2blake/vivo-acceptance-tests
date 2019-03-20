shared_examples "Create People: Delete Lib To Fac Association" do
  it "Delete Librarian-to-Faculty association" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Make the change" do
    $browser.find_element(:link_text, "Class hierarchy").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "Librarian (vivo)").click
    expect($browser.title).to eq("Class Control Panel")
    $browser.find_element(:id, "SuperclassURI").click
    $browser.find_element(:xpath, ".//input[@value='Remove Checked Superclass Links']").click
    expect($browser.title).to eq("Class Control Panel")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Is association gone?" do
    # #<tr><td>pause</td><td>50000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    expect(browser_page_text).to include("Faculty Member (2)")
    expect(browser_page_text).to include("Librarian (1)")
    expect(browser_page_text).to include("Person (3)")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
