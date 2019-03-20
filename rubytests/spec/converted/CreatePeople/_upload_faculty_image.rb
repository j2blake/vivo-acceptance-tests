shared_examples "Create People: Upload Faculty Image" do
  it "Upload image for Jane Faculty in the backend" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Find Jane Faculty via Index" do
    $browser.find_element(:link_text, "Index").click
    expect(browser_page_text).to include("Faculty Member")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify no photo currently exists" do
    $browser.find_element(:xpath, ".//img[@title='no image']")
  end

  it "Select to upload an image" do
    $browser.find_element(:css, "img.add-individual").click
    expect($browser.title).to eq("Upload image for Faculty, Jane")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Upload a photo (JPEG, GIF or PNG)")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
  end

  it "Cancel out before adding a photo" do
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Select a photo to add and then cancel out" do
    $browser.find_element(:css, "img.add-individual").click
    expect($browser.title).to eq("Upload image for Faculty, Jane")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Upload a photo (JPEG, GIF or PNG)")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("Jane1.jpg", __FILE__))
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Cancel after uploading the picture" do
    $browser.find_element(:css, "img.add-individual").click
    expect($browser.title).to eq("Upload image for Faculty, Jane")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Upload a photo (JPEG, GIF or PNG)")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys("/Users/jc55/tomcat/webapps/vivo/utilities/acceptance-tests/suites/CreatePeople/Jane1.jpg")
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Upload image for Faculty, Jane")
    expect(browser_page_text).to include("Photo Upload")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify photo is not there" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:xpath, ".//img[@title='no image']")
    expect($browser.find_elements(:xpath, ".//img[@title='click to view larger image']").size).to eq(0)
  end

  it "Now really add a photo" do
    $browser.find_element(:css, "img.add-individual").click
    expect($browser.title).to eq("Upload image for Faculty, Jane")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Upload a photo (JPEG, GIF or PNG)")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("Jane1.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Faculty, Jane")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Your profile photo will look like the image below.")
    expect(browser_page_text).to include("To make adjustments, you can drag around and resize the photo to the right. When you are happy with your photo click the \"Save Photo\" button.")
    $browser.find_element(:xpath, ".//input[@value='Save photo']").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify photo is there" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_Jane1.jpg</td></tr>
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
