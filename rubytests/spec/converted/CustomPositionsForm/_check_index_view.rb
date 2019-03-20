shared_examples "Custom Positions Form: Check Index View" do
  it "Verify index entries" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Don't login" do
  end

  it "Navigate to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify all 3 organization entries appear properly" do
    $browser.find_element(:link_text, "College")
    expect(browser_page_text).to include("College (1)")
    $browser.find_element(:link_text, "Organization")
    expect(browser_page_text).to include("Organization (3)")
    $browser.find_element(:link_text, "University")
    expect(browser_page_text).to include("University (2)")
  end

  it "Go back to the beginning" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
