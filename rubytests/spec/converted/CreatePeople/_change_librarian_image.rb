shared_examples "Create People: Change Librarian Image" do
  it "Change the uploaded picture for Lily Librarian in the frontend" do
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
    expect($browser.title).to eq("Librarian, Lily Lou")
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_lily1.jpg</td></tr>
  end

  it "Select to edit Lily Librarian's image" do
    $browser.find_element(:css, "img.edit-individual").click
  end

  it "Select to upload a new image but cancel out before cropping" do
    expect($browser.title).to eq("Replace image for Librarian, Lily Lou")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Replace Photo (JPEG, GIF or PNG)")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("lily2.jpg", __FILE__))
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "Select to edit Lily Librarian's image again" do
    $browser.find_element(:css, "img.edit-individual").click
    expect($browser.title).to eq("Replace image for Librarian, Lily Lou")
  end

  it "Select to upload a new image but cancel out during cropping" do
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Replace Photo (JPEG, GIF or PNG)")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("lily2.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Librarian, Lily Lou")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "Select to edit Lily Librarian's image" do
    $browser.find_element(:css, "img.edit-individual").click
    expect($browser.title).to eq("Replace image for Librarian, Lily Lou")
  end

  it "Select to upload a new jpg image" do
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Replace Photo (JPEG, GIF or PNG)")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("lily2.jpg", __FILE__))
    $browser.find_element(:css, "input.submit").click
    expect($browser.title).to eq("Crop image for Librarian, Lily Lou")
    $browser.find_element(:css, "input.submit").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "Verify image has been updated to new one" do
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_lily2.jpg</td></tr>
  end

  it "Select to edit Lily Librarian's image again" do
    $browser.find_element(:css, "img.edit-individual").click
    expect($browser.title).to eq("Replace image for Librarian, Lily Lou")
  end

  it "Select to upload a new png image" do
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("lily3.png", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Librarian, Lily Lou")
    $browser.find_element(:xpath, ".//input[@value='Save photo']").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "Verify image has been updated to new one" do
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_lily3.jpg</td></tr>
  end

  it "Select to edit Lily Librarian's image again" do
    $browser.find_element(:css, "img.edit-individual").click
    expect($browser.title).to eq("Replace image for Librarian, Lily Lou")
  end

  it "Select to upload a new gif image" do
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("lily4.gif", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Librarian, Lily Lou")
    $browser.find_element(:xpath, ".//input[@value='Save photo']").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "Verify image has been updated to new one" do
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_lily4.jpg</td></tr>
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
