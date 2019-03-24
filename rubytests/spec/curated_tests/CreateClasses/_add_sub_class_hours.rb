shared_examples "Create Classes: Add Sub Class Hours" do
  it "Add sub-class of Hours to class Times" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Class heirarchy" do
    $browser.find_element(:link_text, "Class hierarchy").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify sub-class Hours does not already exist" do
    expect($browser.find_elements(:link_text, "core:Hours").size).to eq(0)
    $browser.find_element(:id, "addClass").click
    expect($browser.title).to eq("Class Editing Form")
  end

  it "Add Hours new sub-class" do
    $browser.find_element(:name, "Name").clear
    $browser.find_element(:name, "Name").send_keys("Hours")
    browser_find_select_list(:name, "HiddenFromDisplayBelowRoleLevelUsingRoleUri").select_by(:text, "site admin and root user")
    browser_find_select_list(:name, "ProhibitedFromUpdateBelowRoleLevelUsingRoleUri").select_by(:text, "site admin and root user")
    browser_find_select_list(:name, "HiddenFromPublishBelowRoleLevelUsingRoleUri").select_by(:text, "all users, including public")
    browser_find_select_list(:name, "GroupURI").select_by(:text, "Times")
    $browser.find_element(:name, "LocalName").clear
    $browser.find_element(:name, "LocalName").send_keys("hours")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Class Control Panel")
  end

  it "Verify new Times sub-class Hours added" do
    expect(browser_page_text).to include("Hours")
    expect(browser_page_text).to include("Times")
    expect(browser_page_text).to include("(not identified)")
    expect(browser_page_text).to include("hours")
    expect(browser_page_text).to include("site admin and root user")
    expect(browser_page_text).to include("-1")
    expect(browser_page_text).to include("(unspecified)")
    expect(browser_page_text).to include("http://vivo.mydomain.edu/individual/hours")
    expect(browser_page_text).to include("all users, including public")
    $browser.find_element(:xpath, ".//input[@value='Show All Classes']").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "Hours")
    expect(browser_page_text).to include("Times")
    expect(browser_page_text).to include("http://vivo.mydomain.edu/individual/")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
