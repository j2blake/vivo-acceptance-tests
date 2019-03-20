shared_examples "Create People: Setup Test Tabs" do
  it "Setup Tabs for test purposes--this is not really a test" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Tab management").click
    expect($browser.title).to eq("Tabs")
    $browser.find_element(:xpath, ".//input[@value='Add new tab']").click
    expect($browser.title).to eq("Tab Editing Form")
    $browser.find_element(:id, "Title").clear
    $browser.find_element(:id, "Title").send_keys("People")
    browser_find_select_list(:id, "TabtypeId").select_by(:text, "primary tab")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Tab Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Add New Tab']").click
    expect($browser.title).to eq("Tab Editing Form")
    $browser.find_element(:id, "Title").clear
    $browser.find_element(:id, "Title").send_keys("Faculty")
    browser_find_select_list(:id, "TabtypeId").select_by(:text, "secondary tab")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Tab Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Add existing tab as parent tab']").click
    expect($browser.title).to eq("Super/Subtab Editing Form")
    browser_find_select_list(:id, "ParentId").select_by(:text, "People")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Tab Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Add New Tab']").click
    expect($browser.title).to eq("Tab Editing Form")
    $browser.find_element(:id, "Title").clear
    $browser.find_element(:id, "Title").send_keys("Academic Staff")
    browser_find_select_list(:id, "TabtypeId").select_by(:text, "secondary tab")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Tab Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Add existing tab as parent tab']").click
    expect($browser.title).to eq("Super/Subtab Editing Form")
    browser_find_select_list(:id, "ParentId").select_by(:text, "People")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Tab Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Add New Tab']").click
    expect($browser.title).to eq("Tab Editing Form")
    $browser.find_element(:id, "Title").clear
    $browser.find_element(:id, "Title").send_keys("Librarians")
    browser_find_select_list(:id, "TabtypeId").select_by(:text, "collection")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Tab Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Add existing tab as parent tab']").click
    expect($browser.title).to eq("Super/Subtab Editing Form")
    browser_find_select_list(:id, "ParentId").select_by(:text, "Faculty")
    $browser.find_element(:id, "primaryAction").click
    expect($browser.title).to eq("Tab Control Panel")
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
