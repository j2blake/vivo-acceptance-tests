shared_examples "Short Views: Create Test Departments" do
  it "Create test departments" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Add _Department A_ with a geographic location" do
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Academic Department (vivo)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Department A")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Department A")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[14]").click
    $browser.find_element(:xpath, "(.//img[@alt='add'])[38]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Building A")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Department A")
  end

  it "Add _Department B_ without a geographic location" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Academic Department (vivo)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Department B")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Department B")
  end

  it "Verify index" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Academic Department").click
    expect($browser.title).to eq("Academic Department")
    expect(browser_page_text).to include("Department A Located in Building A")
    $browser.find_element(:link_text, "Department A")
    expect(browser_page_text).to include("Department B")
    $browser.find_element(:link_text, "Department B")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Building").click
    expect($browser.title).to eq("Building")
    $browser.find_element(:link_text, "Building A").click
    expect($browser.title).to eq("Building A")
    $browser.find_element(:link_text, "Department A")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
