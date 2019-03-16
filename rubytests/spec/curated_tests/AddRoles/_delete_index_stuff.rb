shared_examples "Add Roles: Delete Index Stuff" do
  it "Delete everything left in the index" do
  end

  it "Must not be logged in" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify what is to be deleted" do
    expect(browser_page_text).to include("activities")
    expect(browser_page_text).to include("Project (2)")
    expect(browser_page_text).to include("Service (1)")
    expect(browser_page_text).to include("courses")
    expect(browser_page_text).to include("Course (1)")
    expect(browser_page_text).to include("Conference (3)")
    expect(browser_page_text).to include("Event (7)")
    expect(browser_page_text).to include("Invited Talk (1)")
    expect(browser_page_text).to include("Presentation (2)")
    expect(browser_page_text).to include("Workshop (1)")
    expect(browser_page_text).to include("organizations")
    expect(browser_page_text).to include("Association (4)")
    expect(browser_page_text).to include("College (1)")
    expect(browser_page_text).to include("Committee (1)")
    expect(browser_page_text).to include("Department (1)")
    expect(browser_page_text).to include("Group (1)")
    expect(browser_page_text).to include("Museum (1)")
    expect(browser_page_text).to include("Organization (7)")
    expect(browser_page_text).to include("research")
    expect(browser_page_text).to include("Grant (5)")
  end

  it "Delete activities" do
    $browser.find_element(:link_text, "Project").click
    expect($browser.title).to eq("Project")
    $browser.find_element(:link_text, "History of Apes in Africa").click
    expect($browser.title).to eq("History of Apes in Africa")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Project").click
    expect($browser.title).to eq("Project")
    $browser.find_element(:link_text, "Prototype New Ape Home").click
    expect($browser.title).to eq("Prototype New Ape Home")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Service").click
    expect($browser.title).to eq("Service")
    $browser.find_element(:link_text, "Ape Health Program").click
    expect($browser.title).to eq("Ape Health Program")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Delete courses" do
    $browser.find_element(:link_text, "Course").click
    expect($browser.title).to eq("Course")
    $browser.find_element(:link_text, "Introduction to the Ape World").click
    expect($browser.title).to eq("Introduction to the Ape World")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Delete events" do
    $browser.find_element(:link_text, "Conference").click
    expect($browser.title).to eq("Conference")
    $browser.find_element(:link_text, "PoA Annual Conference").click
    expect($browser.title).to eq("PoA Annual Conference")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Conference").click
    expect($browser.title).to eq("Conference")
    $browser.find_element(:link_text, "Ape World").click
    expect($browser.title).to eq("Ape World")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Invited Talk").click
    expect($browser.title).to eq("Invited Talk")
    $browser.find_element(:link_text, "Animal Librarianship").click
    expect($browser.title).to eq("Animal Librarianship")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Presentation").click
    expect($browser.title).to eq("Presentation")
    $browser.find_element(:link_text, "Researching Primates").click
    expect($browser.title).to eq("Researching Primates")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Workshop").click
    expect($browser.title).to eq("Workshop")
    $browser.find_element(:link_text, "Working with Primates").click
    expect($browser.title).to eq("Working with Primates")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Conference").click
    expect($browser.title).to eq("Conference")
    $browser.find_element(:link_text, "USAIN Conference").click
    expect($browser.title).to eq("USAIN Conference")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Delete organizations" do
    $browser.find_element(:link_text, "Association").click
    expect($browser.title).to eq("Association")
    $browser.find_element(:link_text, "American Library Association").click
    expect($browser.title).to eq("American Library Association")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Association").click
    expect($browser.title).to eq("Association")
    $browser.find_element(:link_text, "LITA").click
    expect($browser.title).to eq("LITA")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "College").click
    expect($browser.title).to eq("College")
    $browser.find_element(:link_text, "Carroll College").click
    expect($browser.title).to eq("Carroll College")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Committee").click
    expect($browser.title).to eq("Committee")
    $browser.find_element(:link_text, "Librarians for the Better Treatment of Primates").click
    expect($browser.title).to eq("Librarians for the Better Treatment of Primates")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Department").click
    expect($browser.title).to eq("Department")
    $browser.find_element(:link_text, "Reference Division").click
    expect($browser.title).to eq("Reference Division")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Museum").click
    expect($browser.title).to eq("Museum")
    $browser.find_element(:link_text, "Primates of the World").click
    expect($browser.title).to eq("Primates of the World")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Organization").click
    expect($browser.title).to eq("Organization")
    $browser.find_element(:link_text, "LITA Too").click
    expect($browser.title).to eq("LITA Too")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Association").click
    expect($browser.title).to eq("Association")
    $browser.find_element(:link_text, "Show Me the Primates!").click
    expect($browser.title).to eq("Show Me the Primates!")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Delete grants" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Grant").click
    expect($browser.title).to eq("Grant")
    $browser.find_element(:link_text, "Habitats for Apes").click
    expect($browser.title).to eq("Habitats for Apes")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Grant").click
    expect($browser.title).to eq("Grant")
    $browser.find_element(:link_text, "NIH VIVO").click
    expect($browser.title).to eq("NIH VIVO")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Grant").click
    expect($browser.title).to eq("Grant")
    $browser.find_element(:link_text, "NIH VIVO Too").click
    expect($browser.title).to eq("NIH VIVO Too")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Grant").click
    expect($browser.title).to eq("Grant")
    $browser.find_element(:link_text, "VIVO Cornell Grant").click
    expect($browser.title).to eq("VIVO Cornell Grant")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Grant").click
    expect($browser.title).to eq("Grant")
    $browser.find_element(:link_text, "VIVO Cornell Grant Too").click
    expect($browser.title).to eq("VIVO Cornell Grant Too")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value=\"Edit This Individual\"]").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "_delete").click
    browser_accept_alert("Are you SURE you want to delete this individual? If in doubt, CANCEL.")
    expect($browser.title).to eq("VIVO Site Administration")
  end

  it "Verify everything is gone" do
    vivo_wait_for_indexing
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    expect(browser_page_text).not_to include("courses")
    expect(browser_page_text).not_to include("Course")
    expect(browser_page_text).not_to include("activities")
    expect(browser_page_text).not_to include("Agreement")
    expect(browser_page_text).not_to include("Grant")
  end

  it "Can't check for Project because it appears on botton of every page" do
    expect(browser_page_text).not_to include("Service")
    expect(browser_page_text).not_to include("events")
    expect(browser_page_text).not_to include("Conference")
    expect(browser_page_text).not_to include("Invited Talk")
    expect(browser_page_text).not_to include("Presentation")
    expect(browser_page_text).not_to include("Workshop")
    expect(browser_page_text).not_to include("organizations")
    expect(browser_page_text).not_to include("Association")
    expect(browser_page_text).not_to include("College")
    expect(browser_page_text).not_to include("Committee")
    expect(browser_page_text).not_to include("Department")
    expect(browser_page_text).not_to include("Group")
    expect(browser_page_text).not_to include("Museum")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
