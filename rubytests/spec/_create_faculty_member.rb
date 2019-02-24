shared_examples "Create a Faculty Member" do
  it "logs in as Admin" do
    vivo_login_as("test_admin@mydomain.edu", "Password")
  end

  it "decides to add a faculty member" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")

    $browser.find_element(:id, "VClassURI")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member (vivo)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
  end

  it "creates with the basic info" do
    $browser.find_element(:id, "firstName").send_keys("Jane")
    $browser.find_element(:id, "lastName").send_keys("Faculty")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "adds an overview" do
    $browser.find_element(:class, "add-overview").click
    expect($browser.title).to eq("Edit")

    browser_fill_tinyMCE("Jane is a wonderful professor")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("wonderful professor")
  end

  it "adds a preferred title" do
    $browser.find_element(:css, "section#preferredTitle a.add-ARG_2000028").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("preferred title for")

    $browser.find_element(:id, "preferredTitle").send_keys("Associate Professor")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Associate Professor")
  end

  it "finds the faculty member on the home page" do
    vivo_wait_for_indexing

    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")

    browser_wait_for_jQuery
    $browser.find_element(:link_text, "Faculty, Jane")

    expect($browser.find_element(:id, "research-faculty-mbrs").text).to include("Associate Professor")
  end

  it "logs out" do
    vivo_logout
  end
end
