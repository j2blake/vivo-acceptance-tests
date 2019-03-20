shared_examples "Custom Advises Form: Check Index View" do
  it "Verify index entries" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Don't login" do
  end

  it "Navigate to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify all 4 people entries appear properly" do
    expect(browser_page_text).to include("people")
    expect(browser_page_text).to include("Faculty Member (1)")
    $browser.find_element(:link_text, "Faculty Member")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    expect(browser_page_text).to include("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    expect(browser_page_text).to include("Person (4)")
    $browser.find_element(:link_text, "Person")
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    expect(browser_page_text).to include("Person")
    $browser.find_element(:link_text, "Adams, Jeff")
    $browser.find_element(:link_text, "Doe, John")
    expect(browser_page_text).to include("Faculty, Jane Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane")
    $browser.find_element(:link_text, "Smith, Joe")
  end

  it "Verify both concept entries appear properly" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    expect(browser_page_text).to include("research")
    expect(browser_page_text).to include("Concept (2)")
    $browser.find_element(:link_text, "Concept")
    $browser.find_element(:link_text, "Concept").click
    expect($browser.title).to eq("Concept")
    $browser.find_element(:link_text, "Primate Health")
    $browser.find_element(:link_text, "Primates")
  end

  it "Go back to the beginning" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
