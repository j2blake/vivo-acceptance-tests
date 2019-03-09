shared_examples "Create Accounts: Check Self Editor Privileges" do
  it "Check Unprivileged User Rights" do
  end

  it "Must not be logged in already" do
  end

  it "Login as Richard Rookie" do
    vivo_login_from_home_page_as("RickRookie@mydomain.edu", "newPassword")
    expect($browser.title).to eq("VIVO")
  end

  it "Check privileges: should not see Data Input, Ontology Editor, Site Configuration, Advanced Data Tools." do
    expect(browser_page_text).not_to include("Site Admin")
    expect($browser.find_elements(:link_text, "Site Admin").size).to eq(0)
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
