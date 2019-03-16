shared_examples "Create Properties: Edit Obj Prop Year Founded" do
  it "Edit year founded Display Level and Display Tier" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Object Property Hierarchy" do
    $browser.find_element(:link_text, "Object property hierarchy").click
    expect($browser.title).to eq("VIVO")
  end

  it "Select to open visiting hours" do
    $browser.find_element(:link_text, "year founded (bibo)").click
    expect($browser.title).to eq("Object Property Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit Property Record']").click
    expect($browser.title).to eq("Property Editing Form")
  end

  it "Change Display Level to public and Display Tier to 1000" do
    browser_find_select_list(:name, "HiddenFromDisplayBelowRoleLevelUsingRoleUri").select_by(:text, "curator and above")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Object Property Control Panel")
  end

  it "Verify that changes took place" do
    expect(browser_page_text).to include("curator and above")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
