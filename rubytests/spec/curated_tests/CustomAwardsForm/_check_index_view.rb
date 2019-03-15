shared_examples "Custom Awards Form: Check Index View" do
  it "Verify index entries" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Don't login" do
  end

  it "Navigate to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify all entries appear properly" do
    expect(browser_page_text).to include("people")
    expect(browser_page_text).to include("Faculty Member (1)")
    $browser.find_element(:link_text, "Faculty Member")
    expect(browser_page_text).to include("Person (1)")
    $browser.find_element(:link_text, "Person")
    expect(browser_page_text).to include("organizations")
    expect(browser_page_text).to include("Organization (2)")
    $browser.find_element(:link_text, "Organization")
    expect(browser_page_text).to include("research")
    expect(browser_page_text).to include("Award or Honor (3)")
    $browser.find_element(:link_text, "Award or Honor")
    expect(browser_page_text).to include("Concept (3)")
    $browser.find_element(:link_text, "Concept")
  end

  it "Go back to the beginning" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
