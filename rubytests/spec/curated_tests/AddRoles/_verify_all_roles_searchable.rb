shared_examples "Add Roles: Verify All Roles Searchable" do
  it "Verify all roles are searchable" do
  end

  it "No need to log in" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Verify search results for VIVO" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("VIVO")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'VIVO'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "research")
    expect(browser_page_text).to include("Search results for 'VIVO'")
    expect(browser_page_text).to include("VIVO")
    expect(browser_page_text).to include("NIH VIVO Too Grant")
    expect(browser_page_text).to include("NIH VIVO Grant")
    expect(browser_page_text).to include("VIVO Cornell Grant Too")
    expect(browser_page_text).to include("VIVO Cornell Grant")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
    $browser.find_element(:link_text, "VIVO")
    $browser.find_element(:link_text, "NIH VIVO Too")
    $browser.find_element(:link_text, "NIH VIVO")
    $browser.find_element(:link_text, "VIVO Cornell Grant Too")
    $browser.find_element(:link_text, "VIVO Cornell Grant")
    $browser.find_element(:link_text, "Faculty, Jane")
  end

  it "Verify search results for APE" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("ape")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'ape'")
    expect(browser_page_text).to include("Search results for 'ape'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "activities")
    $browser.find_element(:link_text, "courses")
    $browser.find_element(:link_text, "events")
    $browser.find_element(:link_text, "research")
    expect(browser_page_text).to include("Ape World Conference")
    expect(browser_page_text).to include("Habitats for Apes Grant")
    expect(browser_page_text).to include("Introduction to the Ape World Course")
    expect(browser_page_text).to include("Ape Health Program")
    expect(browser_page_text).to include("History of Apes in Africa Project")
    expect(browser_page_text).to include("Prototype New Ape Home Project")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
    $browser.find_element(:link_text, "Ape World")
    $browser.find_element(:link_text, "Habitats for Apes")
    $browser.find_element(:link_text, "Introduction to the Ape World")
    $browser.find_element(:link_text, "Ape Health Program")
    $browser.find_element(:link_text, "History of Apes in Africa")
    $browser.find_element(:link_text, "Prototype New Ape Home")
    $browser.find_element(:link_text, "Faculty, Jane")
  end

  it "Verify search results for PRIMATE" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("primate")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).to include("Search results for 'primate'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "events")
    $browser.find_element(:link_text, "organizations")
    expect(browser_page_text).to include("Show Me the Primates! Association")
    expect(browser_page_text).to include("Primates of the World Museum")
    expect(browser_page_text).to include("Researching Primates Presentation")
    expect(browser_page_text).to include("Working with Primates Workshop")
    expect(browser_page_text).to include("Librarians for the Better Treatment of Primates Committee")
    expect(browser_page_text).to include("Librarian, Lily Associate Librarian")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
    $browser.find_element(:link_text, "Show Me the Primates!")
    $browser.find_element(:link_text, "Primates of the World")
    $browser.find_element(:link_text, "Researching Primates")
    $browser.find_element(:link_text, "Working with Primates")
    $browser.find_element(:link_text, "Librarians for the Better Treatment of Primates")
    $browser.find_element(:link_text, "Librarian, Lily")
    $browser.find_element(:link_text, "Faculty, Jane")
  end

  it "Verify search results for LIBRARIAN" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("librarian")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).to include("Search results for 'librarian'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "Librarian, Lily")
    $browser.find_element(:link_text, "Librarians for the Better Treatment of Primates")
    $browser.find_element(:link_text, "Reference Division")
    $browser.find_element(:link_text, "Researching Primates")
    $browser.find_element(:link_text, "Show Me the Primates!")
    $browser.find_element(:link_text, "Primates of the World")
    $browser.find_element(:link_text, "Carroll College")
    $browser.find_element(:link_text, "American Library Association")
    $browser.find_element(:link_text, "Animal Librarianship")
    expect(browser_page_text).to include("Librarian, Lily Associate Librarian")
    expect(browser_page_text).to include("Librarians for the Better Treatment of Primates Committee")
    expect(browser_page_text).to include("Reference Division Department")
    expect(browser_page_text).to include("Researching Primates Presentation")
    expect(browser_page_text).to include("Show Me the Primates! Association")
    expect(browser_page_text).to include("Primates of the World Museum")
    expect(browser_page_text).to include("Carroll College College")
    expect(browser_page_text).to include("American Library Association Association")
    expect(browser_page_text).to include("Animal Librarianship Invited Talk")
  end

  it "Verify search results for ANIMAL" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("animal")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).to include("Search results for 'animal'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "events")
    expect(browser_page_text).to include("Animal Librarianship Invited Talk")
    $browser.find_element(:link_text, "Animal Librarianship")
    expect(browser_page_text).to include("USAIN Conference Conference")
    expect(browser_page_text).to include("Librarian, Lily Associate Librarian")
    $browser.find_element(:link_text, "Librarian, Lily")
  end

  it "Verify search results for CARROLL" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("carroll")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).to include("Search results for 'carroll'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Carroll College College")
    $browser.find_element(:link_text, "Librarian, Lily")
    expect(browser_page_text).to include("Librarian, Lily Associate Librarian")
  end

  it "Verify search results for LIBRARY" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("library")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).to include("Search results for 'library'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "American Library Association")
    expect(browser_page_text).to include("American Library Association Association")
    $browser.find_element(:link_text, "Librarian, Lily")
    expect(browser_page_text).to include("Librarian, Lily Associate Librarian")
  end

  it "Verify search results for FACULTY" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("faculty")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).to include("Search results for 'faculty'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "research")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
    expect(browser_page_text).to include("NIH VIVO Too Grant")
    expect(browser_page_text).to include("NIH VIVO Grant")
    expect(browser_page_text).to include("VIVO Cornell Grant Grant")
    expect(browser_page_text).to include("VIVO Cornell Grant Too Grant")
    $browser.find_element(:link_text, "Faculty, Jane")
    $browser.find_element(:link_text, "NIH VIVO Too")
    $browser.find_element(:link_text, "NIH VIVO")
    $browser.find_element(:link_text, "VIVO Cornell Grant")
    $browser.find_element(:link_text, "VIVO Cornell Grant Too")
  end

  it "Verify search results for FACULTY" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("poa")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect(browser_page_text).to include("Search results for 'poa'")
    $browser.find_element(:link_text, "events")
    expect(browser_page_text).to include("PoA Annual Conference Conference")
    $browser.find_element(:link_text, "PoA Annual Conference")
  end

  it "All done" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
