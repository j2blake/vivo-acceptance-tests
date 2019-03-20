shared_examples "Create People: Delete Test People" do
  it "Delete new people Jane Faculty and Lilly Librarian" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Jane Faculty" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("faculty")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Delete Jane Faculty" do
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Mary Marienkäfer" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("faculty")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    $browser.find_element(:link_text, "Marienkäfer, Mary").click
    expect($browser.title).to eq("Marienkäfer, Mary")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Delete Mary Marienkäfer" do
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
  end

  it "Navigate to Lilly Librarian" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("librarian")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    $browser.find_element(:link_text, "Librarian, Lily Lou").click
    expect($browser.title).to eq("Librarian, Lily Lou")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Delete Lilly Librarian" do
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Verify Jane Faculty and Lilly Librarian are gone" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("faculty")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).not_to include("Faculty, Jane")
    expect(browser_page_text).not_to include("Marienkäfer, Mary")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("librarian")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).not_to include("Librarian, Lily Lou")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
