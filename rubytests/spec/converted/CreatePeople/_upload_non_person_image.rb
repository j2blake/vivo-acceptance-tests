shared_examples "Create People: Upload Non Person Image" do
  it "Add image to non-person" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to non-person" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Country").click
    expect($browser.title).to eq("Country")
    $browser.find_element(:link_text, "3").click
    expect($browser.title).to eq("Country")
    $browser.find_element(:link_text, "Germany").click
    expect($browser.title).to eq("Germany")
    expect(browser_page_text).to include("Photo")
  end

  it "Make sure no image exists" do
    expect(browser_page_text).not_to include("//img[@title='click to view larger image']")
  end

  it "Select to add an image" do
    $browser.find_element(:xpath, ".//img[@alt='add']").click
    expect($browser.title).to eq("Upload image for Germany")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Upload a photo (JPEG, GIF or PNG)")
  end

  it "Cancel before doing anything" do
    $browser.find_element(:link_text, "Cancel").click
  end

  it "Hit upload button without selecting a file" do
    expect($browser.title).to eq("Germany")
    $browser.find_element(:xpath, ".//img[@alt='add']").click
    expect($browser.title).to eq("Upload image for Germany")
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Upload image for Germany")
    expect(browser_page_text).to include("Please browse and select a photo.")
  end

  it "Now select to add map then cancel in cropping" do
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("germany1.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Germany")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Germany")
  end

  it "Now really add the map image" do
    $browser.find_element(:xpath, ".//img[@alt='add']").click
    expect($browser.title).to eq("Upload image for Germany")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("germany1.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Germany")
    $browser.find_element(:xpath, ".//input[@value='Save photo']").click
    expect($browser.title).to eq("Germany")
    $browser.find_element(:xpath, ".//img[@title='click to view larger image']")
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_germany1.jpg</td></tr>
  end

  it "Change image to German flag" do
    expect($browser.title).to eq("Germany")
    $browser.find_element(:css, "img.edit-individual").click
    expect($browser.title).to eq("Replace image for Germany")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
    expect(browser_page_text).to include("Replace Photo (JPEG, GIF or PNG)")
  end

  it "Cancel out and verify original image still there" do
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Germany")
    $browser.find_element(:xpath, ".//img[@title='click to view larger image']")
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_germany1.jpg</td></tr>
  end

  it "Cancel out again, this time in cropping phase" do
    $browser.find_element(:css, "img.edit-individual").click
    expect($browser.title).to eq("Replace image for Germany")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("germany2.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Germany")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Germany")
    $browser.find_element(:xpath, ".//img[@title='click to view larger image']")
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_germany1.jpg</td></tr>
  end

  it "Now really change the map to a flag" do
    $browser.find_element(:css, "img.edit-individual").click
    expect($browser.title).to eq("Replace image for Germany")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("germany2.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Germany")
    $browser.find_element(:xpath, ".//input[@value='Save photo']").click
    expect($browser.title).to eq("Germany")
  end

  it "Verify image is changed" do
    $browser.find_element(:xpath, ".//img[@title='click to view larger image']")
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_germany2.jpg</td></tr>
  end

  it "Now delete the image" do
    $browser.find_element(:css, "img.delete-individual").click
    browser_accept_alert("Are you sure you want to delete this photo?")
    expect($browser.title).to eq("Germany")
  end

  it "Verify no image is present" do
    expect($browser.find_elements(:xpath, ".//img[@title='click to view larger image']").size).to eq(0)
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
