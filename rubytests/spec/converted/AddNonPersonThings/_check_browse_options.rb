shared_examples "Add Non Person Things: Check Browse Options" do
  it "Test People rowse" do
  end

  it "Don't need to login" do
    $browser.navigate.to vivo_url("/")
  end

  it "Verify Home page Research option" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:link_text, "Books")
    expect(browser_page_text).to include("1  Books")
    $browser.find_element(:link_text, "Grants")
    expect(browser_page_text).to include("3  Grants")
    $browser.find_element(:link_text, "View all ...").click
    expect($browser.title).to eq("Research")
    $browser.find_element(:link_text, "Article (1)")
    $browser.find_element(:link_text, "Award or Honor (2)")
    $browser.find_element(:link_text, "Blog Posting (1)")
    $browser.find_element(:link_text, "Book (1)")
    $browser.find_element(:link_text, "Concept (7)")
    $browser.find_element(:link_text, "Database (1)")
    $browser.find_element(:link_text, "Grant (3)")
    $browser.find_element(:link_text, "Human Study (1)")
    $browser.find_element(:link_text, "Patent (1)")
    $browser.find_element(:link_text, "Proceedings (1)")
    $browser.find_element(:link_text, "Webpage (1)")
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
  end

  it "Verify Home page People option" do
    expect(browser_page_text).to include("No faculty members found.")
  end

  it "Verify Home page Departments option" do
    expect(browser_page_text).to include("No academic departments found.")
  end

  it "Verify People menu option " do
    $browser.find_element(:link_text, "People").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Person (1)")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Person, Polly")
  end

  it "Verify Organizations menu option " do
    $browser.find_element(:link_text, "Organizations").click
    expect($browser.title).to eq("Organizations")
    $browser.find_element(:link_text, "College (2)")
    $browser.find_element(:link_text, "Company (1)")
    $browser.find_element(:link_text, "Consortium (1)")
    $browser.find_element(:link_text, "Laboratory (1)")
    $browser.find_element(:link_text, "Library (1)")
    $browser.find_element(:link_text, "Organization (7)")
    $browser.find_element(:link_text, "University (1)")
    $browser.find_element(:xpath, ".//li[@id='college']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate College of New York")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Company (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primates-r-us")
    $browser.find_element(:xpath, ".//li[@id='consortium']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate Colleges of the World")
    $browser.find_element(:xpath, ".//li[@id='laboratory']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate Research Laboratory")
    $browser.find_element(:xpath, ".//li[@id='library']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate History Library")
    $browser.find_element(:xpath, ".//li[@id='organization']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Primate College of New York")
    $browser.find_element(:link_text, "Primate Colleges of the World")
    $browser.find_element(:link_text, "Primate History Library")
    $browser.find_element(:link_text, "Primate Research Laboratory")
    $browser.find_element(:link_text, "Primate University of America")
    $browser.find_element(:link_text, "Primates-r-us")
    $browser.find_element(:xpath, ".//li[@id='organization']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "P").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Primate College of New York")
    $browser.find_element(:link_text, "Primate Colleges of the World")
    $browser.find_element(:link_text, "Primate History Library")
    $browser.find_element(:link_text, "Primate Research Laboratory")
    $browser.find_element(:link_text, "Primate University of America")
    $browser.find_element(:link_text, "Primates-r-us")
    $browser.find_element(:link_text, "University (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate University of America")
  end

  it "Verify Research menu option " do
    $browser.find_element(:link_text, "Research").click
    expect($browser.title).to eq("Research")
    $browser.find_element(:link_text, "Article (1)")
    $browser.find_element(:link_text, "Award or Honor (2)")
    $browser.find_element(:link_text, "Blog Posting (1)")
    $browser.find_element(:link_text, "Book (1)")
    $browser.find_element(:link_text, "Concept (7)")
    $browser.find_element(:link_text, "Database (1)")
    $browser.find_element(:link_text, "Grant (3)")
    $browser.find_element(:link_text, "Human Study (1)")
    $browser.find_element(:link_text, "Patent (1)")
    $browser.find_element(:link_text, "Proceedings (1)")
    $browser.find_element(:link_text, "Webpage (1)")
    $browser.find_element(:link_text, "Article (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate Happenings")
    $browser.find_element(:link_text, "Award or Honor (2)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Best Primate College")
    $browser.find_element(:link_text, "Primate Student of the Year")
    $browser.find_element(:xpath, ".//li[@id='book']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "PHC Proceedings")
    $browser.find_element(:xpath, ".//li[@id='concept']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Animal Health")
    $browser.find_element(:link_text, "Ape Health")
    $browser.find_element(:link_text, "Best Primate College")
    $browser.find_element(:link_text, "Elderly Care")
    $browser.find_element(:link_text, "Primate Diet")
    $browser.find_element(:link_text, "Primate Health")
    $browser.find_element(:link_text, "Primate Student of the Year")
    $browser.find_element(:xpath, ".//li[@id='concept']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "P").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate Diet")
    $browser.find_element(:link_text, "Primate Health")
    $browser.find_element(:link_text, "Primate Student of the Year")
    $browser.find_element(:xpath, ".//li[@id='database']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate Info")
    $browser.find_element(:xpath, ".//li[@id='grant']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate Elderly Care")
    $browser.find_element(:link_text, "Primate Habitat Research Grant")
    $browser.find_element(:link_text, "Primate Survival Planning Grant")
    $browser.find_element(:link_text, "Human Study (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Human and Ape Brain Comparison")
    $browser.find_element(:link_text, "Patent (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "USA222333444555")
    $browser.find_element(:xpath, ".//li[@id='proceedings']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "PHC Proceedings")
    $browser.find_element(:xpath, ".//li[@id='webpage']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "http://primatehealthintro.cornell.edu")
  end

  it "Verify Events menu option " do
    $browser.find_element(:link_text, "Events").click
    expect($browser.title).to eq("Events")
    $browser.find_element(:link_text, "Conference (1)")
    $browser.find_element(:link_text, "Event (7)")
    $browser.find_element(:link_text, "Invited Talk (1)")
    $browser.find_element(:link_text, "Performance (1)")
    $browser.find_element(:link_text, "Presentation (1)")
    $browser.find_element(:link_text, "Seminar Series (1)")
    $browser.find_element(:link_text, "Workshop (1)")
    $browser.find_element(:xpath, ".//li[@id='conference']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate Health Conference")
    $browser.find_element(:xpath, ".//li[@id='event']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Introduction to Primate Health")
    $browser.find_element(:link_text, "Introduction to Primates")
    $browser.find_element(:link_text, "New Primate Students")
    $browser.find_element(:link_text, "Primate Health and Fitness")
    $browser.find_element(:link_text, "Primate Health Check")
    $browser.find_element(:link_text, "Primate Health Conference")
    $browser.find_element(:link_text, "Primates in the Wild")
    $browser.find_element(:xpath, ".//li[@id='invitedTalk']/a").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate Health and Fitness")
    $browser.find_element(:link_text, "Performance (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primates in the Wild")
    $browser.find_element(:link_text, "Presentation (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate Health and Fitness")
    $browser.find_element(:link_text, "Seminar Series (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Primate Health Talks")
    $browser.find_element(:link_text, "Workshop (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "New Primate Students")
  end

  it "Go back to Home" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
