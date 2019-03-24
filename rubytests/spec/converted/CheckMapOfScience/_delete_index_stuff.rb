shared_examples "Check Map Of Science: Delete Index Stuff" do
  it "Delete everything left in the index" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Delete all academic articles" do
    $browser.find_element(:link_text, "Academic Article").click
    expect($browser.title).to eq("Academic Article")
    $browser.find_element(:link_text, "Dying for a Drink").click
    expect($browser.title).to eq("Dying for a Drink")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Academic Article").click
    expect($browser.title).to eq("Academic Article")
    $browser.find_element(:link_text, "Alcohol Poisoning Treatment").click
    expect($browser.title).to eq("Alcohol Poisoning Treatment")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Academic Article").click
    expect($browser.title).to eq("Academic Article")
    $browser.find_element(:link_text, "What should I drink?").click
    expect($browser.title).to eq("What should I drink?")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Academic Article").click
    expect($browser.title).to eq("Academic Article")
    $browser.find_element(:link_text, "Latest Alcohol Research").click
    expect($browser.title).to eq("Latest Alcohol Research")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Academic Article").click
    expect($browser.title).to eq("Academic Article")
    $browser.find_element(:link_text, "One For the Road").click
    expect($browser.title).to eq("One For the Road")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Delete all journals" do
    $browser.find_element(:link_text, "Journal").click
    expect($browser.title).to eq("Journal")
    $browser.find_element(:link_text, "Alcohol").click
    expect($browser.title).to eq("Alcohol")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Journal").click
    expect($browser.title).to eq("Journal")
    $browser.find_element(:link_text, "Alcohol And Alcoholism").click
    expect($browser.title).to eq("Alcohol And Alcoholism")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Journal").click
    expect($browser.title).to eq("Journal")
    $browser.find_element(:link_text, "DRINKY POOS").click
    expect($browser.title).to eq("DRINKY POOS")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Journal").click
    expect($browser.title).to eq("Journal")
    $browser.find_element(:link_text, "ALCOHOL RESEARCH & HEALTH").click
    expect($browser.title).to eq("ALCOHOL RESEARCH & HEALTH")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Verify that everything is gone" do
    $browser.find_element(:link_text, "Index").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    expect(browser_page_text).not_to include("research")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
