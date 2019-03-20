shared_examples "Create People: Delete Faculty Image" do
  it "Delete the uploaded picture for Jane Faculty in the backend" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
  end

  it "Verify picture does exist" do
    expect($browser.title).to eq("Faculty, Jane")
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_Jane2.jpg</td></tr>
  end

  it "Select to delete the picture" do
    $browser.find_element(:css, "img.delete-individual").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//img[@title='no image']")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
