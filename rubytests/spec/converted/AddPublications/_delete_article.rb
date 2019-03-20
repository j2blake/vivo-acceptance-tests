shared_examples "Add Publications: Delete Article" do
  it "Delete Article" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to the Index" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Article").click
    expect($browser.title).to eq("Article")
  end

  it "Select the item to delete" do
    $browser.find_element(:link_text, "Too Much Nintendo").click
    expect($browser.title).to eq("Too Much Nintendo")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "Delete the item" do
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>20000</td><td></td></tr>
  end

  it "Verify that there are no articles listed" do
    expect(browser_page_text).not_to include("Article")
    expect(browser_page_text).not_to include("Academic Article")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
