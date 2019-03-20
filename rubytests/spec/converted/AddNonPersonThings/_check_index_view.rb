shared_examples "Add Non Person Things: Check Index View" do
  it "Check index for browse links for roles" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "No need to login" do
  end

  it "Navigate to index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify headings appear" do
    expect(browser_page_text).to include("people")
    expect(browser_page_text).to include("activities")
    expect(browser_page_text).to include("courses")
    expect(browser_page_text).to include("events")
    expect(browser_page_text).to include("organizations")
    expect(browser_page_text).to include("equipment")
    expect(browser_page_text).to include("research")
    expect(browser_page_text).to include("locations")
  end

  it "Verify counts are correct" do
    expect(browser_page_text).to include("Person (1)")
    expect(browser_page_text).to include("Project (1)")
    expect(browser_page_text).to include("Research Project (1)")
    expect(browser_page_text).to include("Service (2)")
    expect(browser_page_text).to include("Transport Service (1)")
    expect(browser_page_text).to include("Course (2)")
    expect(browser_page_text).to include("Conference (1)")
    expect(browser_page_text).to include("Event (7)")
    expect(browser_page_text).to include("Invited Talk (1)")
    expect(browser_page_text).to include("Performance (1)")
    expect(browser_page_text).to include("Presentation (1)")
    expect(browser_page_text).to include("Seminar Series (1)")
    expect(browser_page_text).to include("Workshop (1)")
    expect(browser_page_text).to include("College (2)")
    expect(browser_page_text).to include("Company (1)")
    expect(browser_page_text).to include("Consortium (1)")
    expect(browser_page_text).to include("Laboratory (1)")
    expect(browser_page_text).to include("Library (1)")
    expect(browser_page_text).to include("Organization (7)")
    expect(browser_page_text).to include("University (1)")
    expect(browser_page_text).to include("Equipment (2)")
    expect(browser_page_text).to include("Article (1)")
    expect(browser_page_text).to include("Award or Honor (2)")
    expect(browser_page_text).to include("Blog Posting (1)")
    expect(browser_page_text).to include("Book (1)")
    expect(browser_page_text).to include("Concept (7)")
    expect(browser_page_text).to include("Database (1)")
    expect(browser_page_text).to include("Grant (3)")
    expect(browser_page_text).to include("Human Study (1)")
    expect(browser_page_text).to include("Patent (1)")
    expect(browser_page_text).to include("Proceedings (1)")
    expect(browser_page_text).to include("Webpage (1)")
    expect(browser_page_text).to include("Building (2)")
    expect(browser_page_text).to include("Continent (7)")
    expect(browser_page_text).to include("Facility (5)")
    expect(browser_page_text).to include("Room (1)")
  end

  it "Verify links are correct" do
    $browser.find_element(:link_text, "Person")
    $browser.find_element(:link_text, "Project")
    $browser.find_element(:link_text, "Research Project")
    $browser.find_element(:link_text, "Service")
    $browser.find_element(:link_text, "Transport Service")
    $browser.find_element(:link_text, "Course")
    $browser.find_element(:link_text, "Conference")
    $browser.find_element(:link_text, "Event")
    $browser.find_element(:link_text, "Invited Talk")
    $browser.find_element(:link_text, "Performance")
    $browser.find_element(:link_text, "Presentation")
    $browser.find_element(:link_text, "Seminar Series")
    $browser.find_element(:link_text, "Workshop")
    $browser.find_element(:link_text, "College")
    $browser.find_element(:link_text, "Company")
    $browser.find_element(:link_text, "Consortium")
    $browser.find_element(:link_text, "Laboratory")
    $browser.find_element(:link_text, "Library")
    $browser.find_element(:link_text, "Organization")
    $browser.find_element(:link_text, "University")
    $browser.find_element(:link_text, "Equipment")
    $browser.find_element(:link_text, "Article")
    $browser.find_element(:link_text, "Award or Honor")
    $browser.find_element(:link_text, "Blog Posting")
    $browser.find_element(:link_text, "Book")
    $browser.find_element(:link_text, "Concept")
    $browser.find_element(:link_text, "Database")
    $browser.find_element(:link_text, "Grant")
    $browser.find_element(:link_text, "Human Study")
    $browser.find_element(:link_text, "Patent")
    $browser.find_element(:link_text, "Proceedings")
    $browser.find_element(:link_text, "Webpage")
    $browser.find_element(:link_text, "Building")
    $browser.find_element(:link_text, "Facility")
    $browser.find_element(:link_text, "Room")
  end

  it "Go back to home page" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
