shared_examples "Custom Education Form: Delete Educational Background" do
  it "Delete educational backgrounds and organizations" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Jane Faculty via Index" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
  end

  it "Verify the education to be deleted does indeed exist" do
    expect($browser.find_element(:css, "#RO_0000056-EducationalProcess-List > li").text).to eq("M.Ed. in Business Education, University of Wisconsin , School of Business 2002 -")
    expect($browser.find_element(:xpath, ".//ul[@id='RO_0000056-EducationalProcess-List']/li[2]").text).to eq("M.B.A. in Business Administration, Carroll University , Business Administration Department 1998 - 2000")
    expect($browser.find_element(:xpath, ".//ul[@id='RO_0000056-EducationalProcess-List']/li[3]").text).to eq("B.S. in Business Administration, Carroll College , Business Department, Four year full scholarship 1981")
  end

  it "Delete degrees" do
    $browser.find_element(:css, "a.delete-RO_0000056 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-RO_0000056 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-RO_0000056 > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify all 3 educational background entries are gone" do
    expect(browser_page_text).not_to include("M.Ed. in Business Education, University of Wisconsin, School of Business 2002 -")
    expect(browser_page_text).not_to include("M.B.A. in Business Administration, Carroll University, Business Department 1998 - 2000")
    expect(browser_page_text).not_to include("B.S. in Business Administration, Carroll College, Business Department, Four year full scholarship 1981")
  end

  it "Search for organizations and delete them" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("carroll college")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("Search for 'carroll college'")
    $browser.find_element(:link_text, "Carroll College").click
    expect($browser.title).to eq("Carroll College")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Rebuild search index").click
    expect($browser.title).to eq("Rebuild Search Index")
    $browser.find_element(:name, "rebuild").click
    expect($browser.title).to eq("Rebuild Search Index")
    #<tr><td>waitForTextPresent</td><td>Reset the search index and re-populate it.</td><td></td></tr>
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("carroll college")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).not_to include("Carroll College")
    expect(browser_page_text).to include("No matching results.")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("wisconsin")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("Search for 'wisconsin'")
    $browser.find_element(:link_text, "University of Wisconsin").click
    expect($browser.title).to eq("University of Wisconsin")
    $browser.find_element(:link_text, "Edit this individual").click
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Rebuild search index").click
    expect($browser.title).to eq("Rebuild Search Index")
    $browser.find_element(:name, "rebuild").click
    expect($browser.title).to eq("Rebuild Search Index")
    #<tr><td>waitForTextPresent</td><td>Reset the search index and re-populate it.</td><td></td></tr>
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("wisconsin")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("Search for 'wisconsin'")
    expect(browser_page_text).not_to include("University of Wisconsin")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("carroll university")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("Search for 'carroll university'")
    $browser.find_element(:link_text, "Carroll University").click
    expect($browser.title).to eq("Carroll University")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Rebuild search index").click
    expect($browser.title).to eq("Rebuild Search Index")
    $browser.find_element(:name, "rebuild").click
    expect($browser.title).to eq("Rebuild Search Index")
    #<tr><td>waitForTextPresent</td><td>Reset the search index and re-populate it.</td><td></td></tr>
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("carroll university")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).not_to include("Carroll University")
    expect(browser_page_text).to include("No matching results.")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
