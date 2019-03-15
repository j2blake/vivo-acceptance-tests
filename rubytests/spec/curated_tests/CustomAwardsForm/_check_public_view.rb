shared_examples "Custom Awards Form: Check Public View" do
  it "Verify public view of Jane Faculty's grants" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Don't login" do
  end

  it "Navigate to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify all 3 awards appear properly" do
    expect(browser_page_text).to include("Background")
    expect(browser_page_text).to include("awards and honors")
    expect(browser_page_text).to include("Best Professor, conferred by Carroll College, 2002")
    $browser.find_element(:link_text, "Best Professor")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Primate Expert, conferred by Primates-R-Us, 2004 - 2005")
    $browser.find_element(:link_text, "Primate Expert")
    $browser.find_element(:link_text, "Primates-R-Us")
    expect(browser_page_text).to include("Professor of the Decade, conferred by Carroll College")
    $browser.find_element(:link_text, "Professor of the Decade")
    $browser.find_element(:link_text, "Carroll College")
  end

  it "Go back to the beginning" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
