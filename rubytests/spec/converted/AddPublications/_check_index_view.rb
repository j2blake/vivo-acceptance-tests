shared_examples "Add Publications: Check Index View" do
  it "Check index entries" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Must not be logged in" do
  end

  it "Navigate to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Check index" do
    expect(browser_page_text).to include("people")
    expect(browser_page_text).to include("Faculty Member (1)")
    $browser.find_element(:link_text, "Faculty Member")
    expect(browser_page_text).to include("Person (2)")
    $browser.find_element(:link_text, "Person")
    expect(browser_page_text).to include("events")
    expect(browser_page_text).to include("Conference (1)")
    $browser.find_element(:link_text, "Conference")
    expect(browser_page_text).to include("Event (1)")
    $browser.find_element(:link_text, "Event")
    expect(browser_page_text).to include("organizations")
    expect(browser_page_text).to include("Organization (2)")
    $browser.find_element(:link_text, "Organization")
    expect(browser_page_text).to include("Publisher (2)")
    $browser.find_element(:link_text, "Publisher")
    expect(browser_page_text).to include("research")
    expect(browser_page_text).to include("Academic Article (1)")
    $browser.find_element(:link_text, "Academic Article")
    expect(browser_page_text).to include("Article (2)")
    $browser.find_element(:link_text, "Article")
    expect(browser_page_text).to include("Book (2)")
    $browser.find_element(:link_text, "Book")
    expect(browser_page_text).to include("Chapter (1)")
    $browser.find_element(:link_text, "Chapter")
    expect(browser_page_text).to include("Concept (1)")
    $browser.find_element(:link_text, "Concept")
    expect(browser_page_text).to include("Conference Paper (1)")
    $browser.find_element(:link_text, "Conference Paper")
    expect(browser_page_text).to include("Journal (1)")
    $browser.find_element(:link_text, "Journal")
  end

  it "All done" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
