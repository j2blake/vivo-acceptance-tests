shared_examples "Proxy Editing: Delete Admin Proxy" do
  it "Delete Admin Proxy Editing Relationships" do
  end

  it "Login as admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to profile editing" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Manage profile editing").click
  end

  it "Verify relationships exist" do
    expect(browser_page_text).to include("Proxy, Polly |")
    $browser.find_element(:link_text, "Delete profile editor")
    expect(browser_page_text).to include("Editor, Eddie |")
    $browser.find_element(:link_text, "Delete profile editor")
    expect(browser_page_text).to include("Faculty, Jane | Faculty Member")
    $browser.find_element(:link_text, "Remove selection")
    expect(browser_page_text).to include("Librarian, Lily | Librarian")
    $browser.find_element(:link_text, "Remove selection")
  end

  it "Delete all proxy editing relationships" do
    $browser.find_element(:link_text, "Remove selection").click
    $browser.find_element(:link_text, "Remove selection").click
    $browser.find_element(:name, "modifyProfileList").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "Delete profile editor").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("The operation was successful.")
  end

  it "Verify everything is gone" do
    expect(browser_page_text).not_to include("Proxy, Polly |")
    expect(browser_page_text).not_to include("Editor, Eddie |")
    expect(browser_page_text).not_to include("Faculty, Jane | Faculty Member")
    expect(browser_page_text).not_to include("Librarian, Lily | Librarian")
  end

  it "Test that editing no longer works for Eddie Editor" do
    vivo_logout
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:id, "loginName").clear
    $browser.find_element(:id, "loginName").send_keys("EddieEditor@mydomain.edu")
    $browser.find_element(:id, "loginPassword").clear
    $browser.find_element(:id, "loginPassword").send_keys("Password")
    $browser.find_element(:name, "loginForm").click
    expect($browser.title).to eq("VIVO")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect($browser.find_elements(:link_text, "My profile").size).to eq(0)
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).not_to include("Overview")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
    expect(browser_page_text).not_to include("Overview")
  end

  it "Test that editing no longer works for Connie Curator" do
    vivo_logout
    vivo_login_as("PollyProxy@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect($browser.find_elements(:link_text, "My profile").size).to eq(0)
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).not_to include("Overview")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
