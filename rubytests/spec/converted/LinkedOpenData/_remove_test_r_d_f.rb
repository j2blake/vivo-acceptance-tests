shared_examples "Linked Open Data: Remove Test R D F" do
  it "Remove test RDF" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
  end

  it "---" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Add/Remove RDF data").click
    expect($browser.title).to eq("Ingest RDF Data")
    $browser.find_element(:name, "rdfStream").clear
    $browser.find_element(:name, "rdfStream").send_keys(tester_filepath("TestLinkedOpenData.n3", __FILE__))
    $browser.find_element(:xpath, "(.//input[@name='mode'])[3]").click
    browser_find_select_list(:name, "language").select_by(:text, "N3")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Ingest RDF Data")
    expect(browser_page_text).to include("Removed RDF from file TestLinkedOpenData.n3. Removed 33 statements.")
  end

  it "---" do
    $browser.navigate.to vivo_url("/")
    vivo_logout
    end
  end
