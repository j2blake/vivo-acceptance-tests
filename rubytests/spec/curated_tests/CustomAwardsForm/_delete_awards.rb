shared_examples "Custom Awards Form: Delete Awards" do
  it "Delete all awards setup for test faculty member" do
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

  it "Delete awards one at a time" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
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

  it "Delete index items one at a time" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Organization").click
    expect($browser.title).to eq("Organization")
    $browser.find_element(:link_text, "Carroll College").click
    expect($browser.title).to eq("Carroll College")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Organization").click
    expect($browser.title).to eq("Organization")
    $browser.find_element(:link_text, "Primates-R-Us").click
    expect($browser.title).to eq("Primates-R-Us")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Award or Honor").click
    expect($browser.title).to eq("Award or Honor")
    $browser.find_element(:link_text, "Best Professor").click
    expect($browser.title).to eq("Best Professor")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Award or Honor").click
    expect($browser.title).to eq("Award or Honor")
    $browser.find_element(:link_text, "Primate Expert").click
    expect($browser.title).to eq("Primate Expert")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Award or Honor").click
    expect($browser.title).to eq("Award or Honor")
    $browser.find_element(:link_text, "Professor of the Decade").click
    expect($browser.title).to eq("Professor of the Decade")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    expect($browser.switch_to.alert.text).to eq("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
