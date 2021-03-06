shared_examples "Multi Labels: Remove R D F Data" do
  it "Remove RDF data" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Add/Remove RDF data" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Add/Remove RDF data").click
    expect($browser.title).to eq("Ingest RDF Data")
  end

  it "Remove test file" do
    $browser.find_element(:name, "rdfStream").clear
    $browser.find_element(:name, "rdfStream").send_keys(tester_filepath("TestMultipleLabels.n3", __FILE__))
    $browser.find_element(:xpath, "(.//input[@name='mode'])[3]").click
    browser_find_select_list(:name, "language").select_by(:text, "N3")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Ingest RDF Data")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
