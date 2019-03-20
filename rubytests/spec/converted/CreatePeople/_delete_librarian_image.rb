shared_examples "Create People: Delete Librarian Image" do
  it "Delete the uploaded picture for Lily Librarian in the frontend" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Lily Librarian" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily Lou").click
  end

  it "Select to delete the picture" do
    $browser.find_element(:css, "img.delete-individual").click
    expect($browser.title).to eq("Librarian, Lily Lou")
    $browser.find_element(:xpath, ".//img[@title='no image']")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
