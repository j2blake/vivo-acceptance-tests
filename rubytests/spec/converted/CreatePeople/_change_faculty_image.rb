shared_examples "Create People: Change Faculty Image" do
  it "Change the uploaded picture for Jane Faculty in the backend" do
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
    expect($browser.title).to eq("Faculty, Jane")
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_Jane1.jpg</td></tr>
  end

  it "Select to upload a new image but cancel out" do
    $browser.find_element(:css, "img.edit-individual").click
    expect($browser.title).to eq("Replace image for Faculty, Jane")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Replace Photo (JPEG, GIF or PNG)")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("Jane2.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Faculty, Jane")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Select file to upload again" do
    $browser.find_element(:css, "img.edit-individual").click
    expect($browser.title).to eq("Replace image for Faculty, Jane")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Replace Photo (JPEG, GIF or PNG)")
    $browser.find_element(:xpath, ".//img[@alt='Individual photo']")
    expect($browser.title).to eq("Replace image for Faculty, Jane")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("Jane2.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Faculty, Jane")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Your profile photo will look like the image below.")
    expect(browser_page_text).to include("To make adjustments, you can drag around and resize the photo to the right. When you are happy with your photo click the \"Save Photo\" button.")
    $browser.find_element(:xpath, ".//input[@value='Save photo']").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify image has been updated to new one" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    #<tr><td>verifyAttribute</td><td>//img[@title='click to view larger image']@src</td><td>/vivo/file/*/thumbnail_Jane2.jpg</td></tr>
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
