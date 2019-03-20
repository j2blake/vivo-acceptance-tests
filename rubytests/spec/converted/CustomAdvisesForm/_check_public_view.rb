shared_examples "Custom Advises Form: Check Public View" do
  it "Verify public view of Jane Faculty's advices" do
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

  it "Verify all 3 advisees appear properly" do
    expect(browser_page_text).to include("advisees")
    expect(browser_page_text).to include("faculty mentoring relationship")
    expect(browser_page_text).to include("Adams, Jeff, Ph.D.  candidate, 2011 -")
    $browser.find_element(:link_text, "Adams, Jeff")
    expect(browser_page_text).to include("graduate advising relationship")
    expect(browser_page_text).to include("Doe, John, M.Sc.  candidate, 2007 - 2012")
    $browser.find_element(:link_text, "Doe, John")
    expect(browser_page_text).to include("undergraduate advising relationship")
    expect(browser_page_text).to include("Smith, Joe, B.Sc.  candidate, 2009 -")
    $browser.find_element(:link_text, "Smith, Joe")
  end

  it "Go back to the beginning" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
