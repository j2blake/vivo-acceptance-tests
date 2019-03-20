shared_examples "Custom Positions Form: Delete Positions" do
  it "Delete all positions setup for test faculty member" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to test faculty member" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Delete positions one at a time" do
    $browser.find_element(:css, "a.delete-relatedBy > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-relatedBy > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.delete-relatedBy > img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Delete organizations one at a time" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "College").click
    expect($browser.title).to eq("College")
    $browser.find_element(:link_text, "Carroll College").click
    expect($browser.title).to eq("Carroll College")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Organization").click
    expect($browser.title).to eq("Organization")
    $browser.find_element(:link_text, "Carroll University").click
    expect($browser.title).to eq("Carroll University")
    $browser.find_element(:link_text, "Edit this individual").click
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Organization").click
    expect($browser.title).to eq("Organization")
    $browser.find_element(:link_text, "Cornell University").click
    expect($browser.title).to eq("Cornell University")
    $browser.find_element(:link_text, "Edit this individual").click
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    expect($browser.find_elements(:id, "Organizations").size).to eq(0)
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
