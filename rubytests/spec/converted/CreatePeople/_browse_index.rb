shared_examples "Create People: Browse Index" do
  it "Browse the Index for the new people" do
  end

  it "Must not be logged in" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify that two new people are accounted for" do
    expect(browser_page_text).to include("Faculty Member")
    expect(browser_page_text).to include("Librarian")
    expect(browser_page_text).to include("Person")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
  end

  it "Verify Jane Faculty is on the Faculty Member list" do
    expect(browser_page_text).to include("Faculty, Jane")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
  end

  it "Verify Jane Faculty is on the Librarian list" do
    expect(browser_page_text).to include("Librarian, Lily")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
  end

  it "Verify that both people show up on the People list" do
    expect(browser_page_text).to include("Faculty, Jane")
    expect(browser_page_text).to include("Librarian, Lily")
    $browser.find_element(:link_text, "Index").click
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
