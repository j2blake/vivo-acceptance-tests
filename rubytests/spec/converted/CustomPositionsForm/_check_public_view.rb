shared_examples "Custom Positions Form: Check Public View" do
  it "Verify public view of Jane Faculty's positions" do
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

  it "Verify all 3 positions appear properly" do
    expect(browser_page_text).to include("Positions")
    expect(browser_page_text).to include("Professor, Cornell University 1986 -")
    expect(browser_page_text).to include("Associate Professor, Carroll University 1981 - 1985")
    expect(browser_page_text).to include("Lecturer, Carroll College 1977 - 1981")
    $browser.find_element(:link_text, "Cornell University")
    $browser.find_element(:link_text, "Carroll University")
    $browser.find_element(:link_text, "Carroll College")
  end

  it "Go back to the beginning" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
