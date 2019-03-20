shared_examples "Proxy Editing: Validate Admin Proxy2" do
  it "Validate multiple proxy editors" do
  end

  it "Login as admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to profile editing" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Manage profile editing").click
  end

  it "Add second profile for Eddie Editor" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Manage profile editing").click
    expect($browser.title).to eq("VIVO")
  end

  it "Select Eddie Editor" do
    $browser.find_element(:id, "selectProfileEditors").send_keys("edito")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "selectProfiles").send_keys("librar")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:name, "createRelationship").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify relationship is set" do
    expect(browser_page_text).to include("Editor, Eddie |")
    $browser.find_element(:link_text, "Delete profile editor")
    expect(browser_page_text).to include("Faculty, Jane | Faculty Member")
    $browser.find_element(:link_text, "Remove selection")
    expect(browser_page_text).to include("Librarian, Lily | Librarian")
    $browser.find_element(:link_text, "Remove selection")
  end

  it "Now make 2 people able to edit the same profile" do
  end

  it "Select Eddie Editor" do
    $browser.find_element(:id, "selectProfileEditors").send_keys("edito")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "selectProfileEditors").send_keys("prox")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "selectProfiles").send_keys("facul")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:name, "createRelationship").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Proxy, Polly |")
    $browser.find_element(:link_text, "Delete profile editor")
    expect(browser_page_text).to include("Editor, Eddie |")
    $browser.find_element(:link_text, "Delete profile editor")
  end

  it "Test that editing works for Eddie Editor" do
    vivo_logout
    vivo_login_as("EddieEditor@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect($browser.find_elements(:link_text, "My profile").size).to eq(0)
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
    $browser.find_element(:css, "a.add-overview > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("Eddie is able to edit Lily's profile.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Librarian, Lily")
    expect(browser_page_text).to include("Eddie is able to edit Lily's profile.")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.add-overview > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("Eddie is able to edit Jane's profile.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Eddie is able to edit Jane's profile.")
  end

  it "Test that editing works for Polly Proxy" do
    vivo_logout
    vivo_login_as("PollyProxy@mydomain.edu", "myPassword")
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("Password")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("Password")
    $browser.find_element(:name, "passwordChangeForm").click
    expect($browser.title).to eq("VIVO")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    expect($browser.find_elements(:link_text, "My profile").size).to eq(0)
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "a.edit-overview > img.edit-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("Polly is able to edit Jane's profile too.")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Polly is able to edit Jane's profile too.")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
    expect(browser_page_text).not_to include("Overview")
  end

  it "Verify that both editors show up for Jane Faculty" do
    vivo_logout
    vivo_login_as("JaneFaculty@mydomain.edu", "myPassword")
    expect($browser.title).to eq("Log in - VIVO")
    $browser.find_element(:id, "newPassword").clear
    $browser.find_element(:id, "newPassword").send_keys("Password")
    $browser.find_element(:id, "confirmPassword").clear
    $browser.find_element(:id, "confirmPassword").send_keys("Password")
    $browser.find_element(:name, "passwordChangeForm").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My profile").click
    expect($browser.title).to eq("Faculty, Jane")
    expect(browser_page_text).to include("Overview")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My account").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Proxy, Polly |")
    $browser.find_element(:link_text, "Remove selection")
    expect(browser_page_text).to include("Editor, Eddie |")
    $browser.find_element(:link_text, "Remove selection")
    $browser.action.move_to($browser.find_element(:id, "user-menu")).perform
    $browser.find_element(:link_text, "My profile").click
    expect($browser.title).to eq("Faculty, Jane")
    $browser.find_element(:css, "img.delete-individual").click
    expect($browser.title).to eq("Edit")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
