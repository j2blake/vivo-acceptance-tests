shared_examples "Add Roles: Check Public View" do
  it "Check public view of Jane Faculty and Lily Librarian" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "No need to login" do
  end

  it "Navigate to Jane Faculty" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify roles for Jane Faculty" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[10]").click
    expect(browser_page_text).to include("clinical activities")
    expect(browser_page_text).to include("Ape Health Program Founder 1993 -")
    $browser.find_element(:link_text, "Ape Health Program")
    expect(browser_page_text).to include("Prototype New Ape Home Designer 1990 - 1991")
    $browser.find_element(:link_text, "Prototype New Ape Home")
    expect(browser_page_text).to include("principal investigator on")
    expect(browser_page_text).to include("NIH VIVO Too 2010 -")
    $browser.find_element(:link_text, "NIH VIVO Too")
    expect(browser_page_text).to include("co-principal investigator on")
    expect(browser_page_text).to include("NIH VIVO 2009 - 2010")
    $browser.find_element(:link_text, "NIH VIVO")
    expect(browser_page_text).to include("VIVO Cornell Grant 2007 - 2009")
    $browser.find_element(:link_text, "VIVO Cornell Grant")
    expect(browser_page_text).to include("investigator on")
    expect(browser_page_text).to include("VIVO Cornell Grant Too 2009")
    $browser.find_element(:link_text, "VIVO Cornell Grant Too")
    expect(browser_page_text).to include("other research activities")
    expect(browser_page_text).to include("History of Apes in Africa Consultant 2010 -")
    $browser.find_element(:link_text, "History of Apes in Africa")
    expect(browser_page_text).to include("Habitats for Apes Researcher 1980 - 1985")
    $browser.find_element(:link_text, "Habitats for Apes")
    expect(browser_page_text).to include("teaching activities")
    expect(browser_page_text).to include("Ape World Planner 2009")
    $browser.find_element(:link_text, "Ape World")
    expect(browser_page_text).to include("Working with Primates Co-Instructor 2000 - 2005")
    $browser.find_element(:link_text, "Working with Primates")
    expect(browser_page_text).to include("Introduction to the Ape World Creator 2000 - 2001")
    $browser.find_element(:link_text, "Introduction to the Ape World")
    expect(browser_page_text).to include("attended")
    expect(browser_page_text).to include("PoA Annual Conference 2000 - 2010")
    $browser.find_element(:link_text, "PoA Annual Conference")
  end

  it "Navigate to Lily Librarian" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Librarian").click
    expect($browser.title).to eq("Librarian")
    $browser.find_element(:link_text, "Librarian, Lily").click
    expect($browser.title).to eq("Librarian, Lily")
  end

  it "Verify roles for Lily Librarian" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[10]").click
    expect(browser_page_text).to include("head of")
    expect(browser_page_text).to include("Reference Division Head Librarian 2009 -")
    $browser.find_element(:link_text, "Reference Division")
    expect(browser_page_text).to include("member of")
    expect(browser_page_text).to include("American Library Association Member 1988 -")
    $browser.find_element(:link_text, "American Library Association")
    expect(browser_page_text).to include("presentations")
    expect(browser_page_text).to include("invited talk")
    expect(browser_page_text).to include("Animal Librarianship, Member of panel, USAIN Conference 2003")
    $browser.find_element(:link_text, "Animal Librarianship")
    expect(browser_page_text).to include("presentation")
    expect(browser_page_text).to include("Researching Primates, Presenter 2009")
    $browser.find_element(:link_text, "Researching Primates")
    expect(browser_page_text).to include("professional service activities")
    expect(browser_page_text).to include("Carroll College Consultant 2010 -")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Primates of the World Board 2001 - 2003")
    $browser.find_element(:link_text, "Primates of the World")
    expect(browser_page_text).to include("outreach and community service")
    expect(browser_page_text).to include("Librarians for the Better Treatment of Primates Chair 2009 -")
    $browser.find_element(:link_text, "Librarians for the Better Treatment of Primates")
    expect(browser_page_text).to include("Show Me the Primates! Booth 2001")
    $browser.find_element(:link_text, "Show Me the Primates!")
  end

  it "Go back to VIVO home page" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
