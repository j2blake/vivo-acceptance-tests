shared_examples "Add Roles: Check Index View" do
  it "Check index for browse links for roles" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "No need to login" do
  end

  it "Navigate to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify counts correct" do
    expect(browser_page_text).to include("people")
    expect(browser_page_text).to include("Faculty Member (1)")
    expect(browser_page_text).to include("Librarian (1)")
    expect(browser_page_text).to include("Person (2)")
    expect(browser_page_text).to include("activities")
    expect(browser_page_text).to include("Project (2)")
    expect(browser_page_text).to include("courses")
    expect(browser_page_text).to include("Course (1)")
    expect(browser_page_text).to include("events")
    expect(browser_page_text).to include("Conference (3)")
    expect(browser_page_text).to include("Event (7)")
    expect(browser_page_text).to include("Invited Talk (1)")
    expect(browser_page_text).to include("Presentation (2)")
    expect(browser_page_text).to include("Workshop (1)")
    expect(browser_page_text).to include("organizations")
    expect(browser_page_text).to include("Association (2)")
    expect(browser_page_text).to include("College (1)")
    expect(browser_page_text).to include("Committee (1)")
    expect(browser_page_text).to include("Department (1)")
    expect(browser_page_text).to include("Group (1)")
    expect(browser_page_text).to include("Museum (1)")
    expect(browser_page_text).to include("Organization (5)")
    expect(browser_page_text).to include("research")
    expect(browser_page_text).to include("Grant (5)")
  end

  it "Verify links correct" do
    $browser.find_element(:link_text, "Faculty Member")
    $browser.find_element(:link_text, "Librarian")
    $browser.find_element(:link_text, "Person")
    $browser.find_element(:link_text, "Project")
    $browser.find_element(:link_text, "Course")
    $browser.find_element(:link_text, "Conference")
    $browser.find_element(:link_text, "Event")
    $browser.find_element(:link_text, "Invited Talk")
    $browser.find_element(:link_text, "Presentation")
    $browser.find_element(:link_text, "Workshop")
    $browser.find_element(:link_text, "Association")
    $browser.find_element(:link_text, "College")
    $browser.find_element(:link_text, "Committee")
    $browser.find_element(:link_text, "Department")
    $browser.find_element(:link_text, "Group")
    $browser.find_element(:link_text, "Museum")
    $browser.find_element(:link_text, "Organization")
    $browser.find_element(:link_text, "Grant")
  end

  it "Go back to home page" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
