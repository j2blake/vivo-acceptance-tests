shared_examples "Create People: Upload Librarian Image" do
  it "Upload image for Lily Librarian in the frontend" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Index").click
  end

  it "Find Lily Librarian via Index" do
    expect(browser_page_text).to include("Librarian")
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily Lou").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "Verify no photo currently exists" do
    $browser.find_element(:xpath, ".//img[@title='no image']")
  end

  it "Select to update this individual's picture" do
    $browser.find_element(:xpath, ".//img[@alt='add']").click
    expect($browser.title).to eq("Upload image for Librarian, Lily Lou")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Upload a photo (JPEG, GIF or PNG)")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
  end

  it "Cancel out before adding a photo" do
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "Select a photo to add and then cancel out" do
    $browser.find_element(:xpath, ".//img[@alt='add']").click
    expect($browser.title).to eq("Upload image for Librarian, Lily Lou")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Upload a photo (JPEG, GIF or PNG)")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("lily1.jpg", __FILE__))
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "Cancel after uploading the picture" do
    $browser.find_element(:xpath, ".//img[@alt='add']").click
    expect($browser.title).to eq("Upload image for Librarian, Lily Lou")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Upload a photo (JPEG, GIF or PNG)")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("lily1.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Librarian, Lily Lou")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "Verify photo is not there" do
    $browser.find_element(:xpath, ".//img[@title='no image']")
    expect($browser.find_elements(:xpath, ".//img[@title='click to view larger image']").size).to eq(0)
  end

  it "Try to add an image that is smaller than required" do
    $browser.find_element(:xpath, ".//img[@alt='add']").click
    expect($browser.title).to eq("Upload image for Librarian, Lily Lou")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("lilysmall.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Upload image for Librarian, Lily Lou")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Upload a photo (JPEG, GIF or PNG)")
    expect(browser_page_text).to include("The uploaded image should be at least 200 pixels high and 200 pixels wide.")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
  end

  it "Try to add an image that is larger than allowed" do
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("lilylarge.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Upload image for Librarian, Lily Lou")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Upload a photo (JPEG, GIF or PNG)")
    expect(browser_page_text).to include("Please upload an image smaller than 6 megabytes")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
  end

  it "Now really add a photo" do
    expect($browser.title).to eq("Upload image for Librarian, Lily Lou")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("lily1.jpg", __FILE__))
    $browser.find_element(:css, "input.submit").click
    expect($browser.title).to eq("Crop image for Librarian, Lily Lou")
    $browser.find_element(:css, "input.submit").click
    expect($browser.title).to eq("Librarian, Lily Lou")
  end

  it "Verify photo is there" do
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_lily1.jpg</td></tr>
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
