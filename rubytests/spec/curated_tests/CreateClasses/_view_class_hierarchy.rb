shared_examples "Create Classes: View Class Hierarchy" do
  it "View Class hierarchy" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Class hierarchy" do
    $browser.find_element(:link_text, "Class hierarchy").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify that core:Hour exists" do
    $browser.find_element(:link_text, "Hours")
    expect(browser_page_text).to include("Class Group")
    expect(browser_page_text).to include("Times")
    expect(browser_page_text).to include("Ontology")
    expect(browser_page_text).to include("http://vivo.mydomain.edu/individual/")
  end

  it "Navigate to core:Hours" do
    $browser.find_element(:link_text, "Hours").click
    expect($browser.title).to eq("Class Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Show Hierarchy below This Class']").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify core:Hours info is correct" do
    $browser.find_element(:link_text, "Hours")
    expect(browser_page_text).to include("Class Group")
    expect(browser_page_text).to include("Times")
    expect(browser_page_text).to include("Ontology")
    expect(browser_page_text).to include("http://vivo.mydomain.edu/individual/")
    $browser.find_element(:link_text, "Hours").click
    expect($browser.title).to eq("Class Control Panel")
  end

  it "View class groups" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Class groups").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "Times")
    expect(browser_page_text).to include("Classes")
    $browser.find_element(:link_text, "Hours")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
