shared_examples "Process R D F Data: Export R D F File" do
  it "Export RDF data" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Go to RDF export option on Site Admin page" do
    $browser.find_element(:link_text, "RDF export").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:name, "subgraph").click
    $browser.find_element(:xpath, ".//input[@name='assertedOrInferred' and @value='full']").click
    browser_find_select_list(:name, "format").select_by(:text, "RDF/XML")
    $browser.find_element(:name, "submit").click
  end

  it "Go back to VIVO" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
