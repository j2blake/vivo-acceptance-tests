shared_examples "Create Properties: Delete Obj Prop Year Founded" do
  it "Delete test Object Property year founded" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Navigate to Object Properties" do
    $browser.find_element(:link_text, "Object property hierarchy").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify that year founded does indeed exist" do
    $browser.find_element(:link_text, "year founded (bibo)")
  end

  it "Select to edit year founded" do
    $browser.find_element(:link_text, "year founded (bibo)").click
    expect($browser.title).to eq("Object Property Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit Property Record']").click
    expect($browser.title).to eq("Property Editing Form")
  end

  it "Delete visiting hours" do
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this record? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO")
  end

  it "Verify visiting hours is gone" do
    expect(browser_page_text).not_to include("year founded (bibo)")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
