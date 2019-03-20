shared_examples "Custom Education Form: Check Public View" do
  it "Verify public view of Jane Faculty's education" do
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

  it "Verify all 3 degrees appear properly" do
    expect(browser_page_text).to include("Background")
    expect(browser_page_text).to include("education and training")
    expect($browser.find_element(:css, "#RO_0000056-EducationalProcess-List > li").text).to eq("M.Ed. in Business Education, University of Wisconsin , School of Business 2002 -")
    expect($browser.find_element(:xpath, ".//ul[@id='RO_0000056-EducationalProcess-List']/li[2]").text).to eq("M.B.A. in Business Administration, Carroll University , Business Administration Department 1998 - 2000")
    expect($browser.find_element(:xpath, ".//ul[@id='RO_0000056-EducationalProcess-List']/li[3]").text).to eq("B.S. in Business Administration, Carroll College , Business Department, Four year full scholarship 1981")
    $browser.find_element(:link_text, "University of Wisconsin")
    $browser.find_element(:link_text, "Carroll University")
    $browser.find_element(:link_text, "Carroll College")
  end

  it "Go back to the beginning" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
