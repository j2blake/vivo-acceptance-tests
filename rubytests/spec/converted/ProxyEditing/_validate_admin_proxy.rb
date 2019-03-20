shared_examples "Proxy Editing: Validate Admin Proxy" do
  it "Validate Admin Proxy Editing" do
  end

  it "Login as admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to profile editing" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Manage profile editing").click
  end

  it "Verify that correct fields and text are present" do
    expect(browser_page_text).to include("Manage profile editing")
    expect(browser_page_text).to include("Relate profile editors and profiles")
    expect(browser_page_text).to include("Select editors")
    expect(browser_page_text).to include("Select profiles")
    expect(browser_page_text).to include("Profile editors")
  end

  it "Enter nothing and get error message" do
    $browser.find_element(:name, "createRelationship").click
    expect(browser_page_text).to include("You must select a minimum of 1 editor and profile.")
    expect($browser.title).to eq("VIVO")
  end

  it "Select profile, but not editor" do
    $browser.find_element(:name, "createRelationship").click
    $browser.find_element(:id, "selectProfiles").send_keys("facul")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    expect(browser_page_text).to include("You must select a minimum of 1 editor and profile.")
    $browser.find_element(:link_text, "Remove selection").click
  end

  it "Select editor, but not profile" do
  end

  it "Select Eddie Editor" do
    $browser.find_element(:id, "selectProfileEditors").send_keys("edito")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:name, "createRelationship").click
    expect(browser_page_text).to include("You must select a minimum of 1 editor and profile.")
    $browser.find_element(:link_text, "Remove selection").click
  end

  it "Enter one of each" do
  end

  it "Select Eddie Editor" do
    $browser.find_element(:id, "selectProfileEditors").send_keys("edito")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    expect(browser_page_text).to include("Editor, Eddie |")
    $browser.find_element(:link_text, "Remove selection")
    $browser.find_element(:id, "selectProfiles").send_keys("facul")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("Faculty, Jane | Faculty Member")
    $browser.find_element(:link_text, "Remove selection")
  end

  it "Remove editor and attempt to save" do
    $browser.find_element(:link_text, "Remove selection").click
    $browser.find_element(:name, "createRelationship").click
    expect(browser_page_text).to include("You must select a minimum of 1 editor and profile.")
  end

  it "Add back editor and then remove profile" do
  end

  it "Select Eddie Editor" do
    $browser.find_element(:id, "selectProfileEditors").send_keys("edito")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:css, "p.proxy-info-profile > a.remove-proxy").click
    $browser.find_element(:name, "createRelationship").click
    expect(browser_page_text).to include("You must select a minimum of 1 editor and profile.")
  end

  it "Add one link" do
    expect(browser_page_text).to include("Editor, Eddie |")
    $browser.find_element(:id, "selectProfiles").send_keys("facul")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Remove selection")
    expect(browser_page_text).to include("Faculty, Jane | Faculty Member")
    $browser.find_element(:link_text, "Remove selection")
    $browser.find_element(:name, "createRelationship").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify relationship is set" do
    expect(browser_page_text).to include("Editor, Eddie |")
    $browser.find_element(:link_text, "Delete profile editor")
    expect(browser_page_text).to include("Add profile")
    expect(browser_page_text).to include("Selected profiles:")
    expect(browser_page_text).to include("Faculty, Jane | Faculty Member")
    $browser.find_element(:link_text, "Remove selection")
  end

  it "Try to add relationship again" do
  end

  it "Select Eddie Editor" do
    $browser.find_element(:id, "selectProfileEditors").send_keys("edito")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "selectProfiles").send_keys("facul")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:name, "createRelationship").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:id, "addProfile").clear
    $browser.find_element(:id, "addProfile").send_keys("")
    #<tr><td>sendKeys</td><td>id=addProfile</td><td>facul</td></tr>
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("no match")
  end

  it "Test that editing works" do
    vivo_logout
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:id, "loginName").clear
    $browser.find_element(:id, "loginName").send_keys("EddieEditor@mydomain.edu")
    $browser.find_element(:id, "loginPassword").clear
    $browser.find_element(:id, "loginPassword").send_keys("myPassword")
    $browser.find_element(:name, "loginForm").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("Password")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("Password")
    $browser.find_element(:name, "passwordChangeForm").click
    expect($browser.title).to eq("VIVO")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-overview > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("Eddie is able to edit.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Eddie is able to edit.")
  end

  it "Check My options " do
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect($browser.find_elements(:link_text, "My profile").size).to eq(0)
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
