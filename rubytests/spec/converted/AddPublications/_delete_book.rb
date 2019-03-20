shared_examples "Add Publications: Delete Book" do
  it "Delete Book" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to the Index" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Book").click
    expect($browser.title).to eq("Book")
  end

  it "Delete first book" do
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?").click
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Delete second book" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Book").click
    expect($browser.title).to eq("Book")
    $browser.find_element(:link_text, "Kids in the 21st Century").click
    expect($browser.title).to eq("Kids in the 21st Century")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Verify all books are gone" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
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
    expect(browser_page_text).not_to include("Book")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
