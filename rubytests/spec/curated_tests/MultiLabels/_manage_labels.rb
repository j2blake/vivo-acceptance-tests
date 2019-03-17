shared_examples "Multi Labels: Manage Labels" do
  it "Manage Labels" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Verify manage labels icon is on profile" do
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:css, "a.add-label > img.add-individual")
  end

  it "Check available labels" do
    $browser.find_element(:css, "a.add-label > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Manage Labels for Furter, Frank")
    expect(browser_page_text).to include("Furter, Frank Edit Remove")
    expect(browser_page_text).to include("Test Label 1 Edit Remove")
    expect(browser_page_text).to include("Test Label 2 Edit Remove")
    $browser.find_element(:link_text, "Edit")
    $browser.find_element(:link_text, "Remove")
    $browser.find_element(:css, "#showCancelOnly > a.cancel")
  end

  it "Remove first label" do
    $browser.find_element(:link_text, "Remove").click
    browser_accept_alert("Are you sure you wish to delete this label?")
    expect(browser_page_text).not_to include("Furter, Frank Edit Remove")
    expect(browser_page_text).to include("Test Label 1 Edit Remove")
    expect(browser_page_text).to include("Test Label 2 Edit Remove")
  end

  it "Remove second label" do
    $browser.find_element(:css, "#showCancelOnly > a.cancel").click
    expect($browser.title).to eq("Test Label 1")
    $browser.find_element(:css, "a.add-label > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Remove").click
    browser_accept_alert("Are you sure you wish to delete this label?")
    expect(browser_page_text).not_to include("Furter, Frank Edit Remove")
    expect(browser_page_text).not_to include("Test Label 1 Edit Remove")
    expect(browser_page_text).to include("Test Label 2 Edit Remove")
  end

  it "Verify that new label displays" do
    $browser.find_element(:css, "#showCancelOnly > a.cancel").click
    expect($browser.title).to eq("Test Label 2")
    expect(browser_page_text).to include("Test Label 2")
    expect(browser_page_text).not_to include("Furter, Frank")
    expect(browser_page_text).not_to include("Test Label 1")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
