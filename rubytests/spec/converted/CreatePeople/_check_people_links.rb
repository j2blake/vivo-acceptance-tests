shared_examples "Create People: Check People Links" do
  it "Double check that all People links are correct" do
  end

  it "Must not be logged in" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "People").click
    expect($browser.title).to eq("People")
    $browser.find_element(:link_text, "Faculty Member (1)").click
  end

  it "Verify that Lilly Librarian appears in Faculty and Librarians" do
    expect($browser.title).to eq("People")
    expect(browser_page_text).to include("Faculty, Jane")
    expect(browser_page_text).to include("Librarian")
    expect(browser_page_text).to include("Librarian, Lily")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
