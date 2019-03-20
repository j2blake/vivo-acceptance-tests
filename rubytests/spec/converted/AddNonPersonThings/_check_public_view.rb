shared_examples "Add Non Person Things: Check Public View" do
  it "Check public view of non-person things" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "No need to login" do
  end

  it "Navigate to index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify Activities" do
    $browser.find_element(:link_text, "Project").click
    expect($browser.title).to eq("Project")
    $browser.find_element(:link_text, "Human and Ape Brain Comparison").click
    expect($browser.title).to eq("Human and Ape Brain Comparison")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Research Project").click
    expect($browser.title).to eq("Research Project")
    $browser.find_element(:link_text, "Human and Ape Brain Comparison").click
    expect($browser.title).to eq("Human and Ape Brain Comparison")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Service").click
    expect($browser.title).to eq("Service")
    $browser.find_element(:link_text, "Primate Heart Health").click
    expect($browser.title).to eq("Primate Heart Health")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Service").click
    expect($browser.title).to eq("Service")
    $browser.find_element(:link_text, "Gorilla Moving Company").click
    expect($browser.title).to eq("Gorilla Moving Company")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Transport Service").click
    expect($browser.title).to eq("Transport Service")
    $browser.find_element(:link_text, "Gorilla Moving Company").click
    expect($browser.title).to eq("Gorilla Moving Company")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify Courses" do
    $browser.find_element(:link_text, "Course").click
    expect($browser.title).to eq("Course")
    $browser.find_element(:link_text, "Introduction to Primate Health").click
    expect($browser.title).to eq("Introduction to Primate Health")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Course").click
    expect($browser.title).to eq("Course")
    $browser.find_element(:link_text, "Introduction to Primates").click
    expect($browser.title).to eq("Introduction to Primates")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify Events" do
    $browser.find_element(:link_text, "Conference").click
    expect($browser.title).to eq("Conference")
    $browser.find_element(:link_text, "Primate Health Conference").click
    expect($browser.title).to eq("Primate Health Conference")
    $browser.find_element(:link_text, "Primate Health and Fitness")
    expect(browser_page_text).to include("has subject area")
    $browser.find_element(:link_text, "Animal Health")
    expect(browser_page_text).to include("Animal Health")
    expect(browser_page_text).to include("description")
    $browser.find_element(:link_text, "PHC Proceedings")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Invited Talk").click
    expect($browser.title).to eq("Invited Talk")
    $browser.find_element(:link_text, "Primate Health and Fitness").click
    expect($browser.title).to eq("Primate Health and Fitness")
    $browser.find_element(:link_text, "Introduction to Primate Health")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Performance").click
    expect($browser.title).to eq("Performance")
    $browser.find_element(:link_text, "Primates in the Wild").click
    expect($browser.title).to eq("Primates in the Wild")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Presentation").click
    expect($browser.title).to eq("Presentation")
    $browser.find_element(:link_text, "Primate Health and Fitness").click
    expect($browser.title).to eq("Primate Health and Fitness")
    $browser.find_element(:link_text, "Introduction to Primate Health")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Seminar Series").click
    expect($browser.title).to eq("Seminar Series")
    $browser.find_element(:link_text, "Primate Health Talks").click
    expect($browser.title).to eq("Primate Health Talks")
    $browser.find_element(:link_text, "Introduction to Primate Health")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Workshop").click
    expect($browser.title).to eq("Workshop")
    $browser.find_element(:link_text, "New Primate Students").click
    expect($browser.title).to eq("New Primate Students")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Verify Organizations" do
    $browser.find_element(:link_text, "College").click
    expect($browser.title).to eq("College")
    $browser.find_element(:link_text, "Primate College of America").click
    expect($browser.title).to eq("Primate College of America")
    $browser.find_element(:link_text, "B.S. Bachelor of Science")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "College").click
    expect($browser.title).to eq("College")
    $browser.find_element(:link_text, "Primate College of New York").click
    expect($browser.title).to eq("Primate College of New York")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Company").click
    expect($browser.title).to eq("Company")
    $browser.find_element(:link_text, "Primates-r-us").click
    expect($browser.title).to eq("Primates-r-us")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Consortium").click
    expect($browser.title).to eq("Consortium")
    $browser.find_element(:link_text, "Primate Colleges of the World").click
    expect($browser.title).to eq("Primate Colleges of the World")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Laboratory").click
    expect($browser.title).to eq("Laboratory")
    $browser.find_element(:link_text, "Primate Research Laboratory").click
    expect($browser.title).to eq("Primate Research Laboratory")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Library").click
    expect($browser.title).to eq("Library")
    $browser.find_element(:link_text, "Primate History Library").click
    expect($browser.title).to eq("Primate History Library")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "University").click
    expect($browser.title).to eq("University")
    $browser.find_element(:link_text, "Primate University of America").click
    expect($browser.title).to eq("Primate University of America")
    $browser.find_element(:link_text, "Jane Memorial Building")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Organization").click
    expect($browser.title).to eq("Organization")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Primate College of New York")
    $browser.find_element(:link_text, "Primate Colleges of the World")
    $browser.find_element(:link_text, "Primate History Library")
    $browser.find_element(:link_text, "Primate Research Laboratory")
    $browser.find_element(:link_text, "Primate University of America")
    $browser.find_element(:link_text, "Primates-r-us")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Verify Equipment" do
    $browser.find_element(:link_text, "Equipment").click
    expect($browser.title).to eq("Equipment")
    $browser.find_element(:link_text, "Portable Primate Habitat").click
    expect($browser.title).to eq("Portable Primate Habitat")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Equipment").click
    expect($browser.title).to eq("Equipment")
    $browser.find_element(:link_text, "Primate Feeder").click
    expect($browser.title).to eq("Primate Feeder")
    $browser.find_element(:link_text, "Primate Research Laboratory")
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify Research" do
    $browser.find_element(:link_text, "Article").click
    expect($browser.title).to eq("Article")
    $browser.find_element(:link_text, "Primate Happenings").click
    expect($browser.title).to eq("Primate Happenings")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Award or Honor").click
    expect($browser.title).to eq("Award or Honor")
    $browser.find_element(:link_text, "Best Primate College").click
    expect($browser.title).to eq("Best Primate College")
    $browser.find_element(:link_text, "Best Primate College (Primate College of America)")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Award or Honor").click
    expect($browser.title).to eq("Award or Honor")
    $browser.find_element(:link_text, "Primate Student of the Year").click
    expect($browser.title).to eq("Primate Student of the Year")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Blog Posting").click
    expect($browser.title).to eq("Blog Posting")
    $browser.find_element(:link_text, "Primate Happenings").click
    expect($browser.title).to eq("Primate Happenings")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Book").click
    expect($browser.title).to eq("Book")
    $browser.find_element(:link_text, "PHC Proceedings")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Concept").click
    expect($browser.title).to eq("Concept")
    $browser.find_element(:link_text, "Animal Health")
    $browser.find_element(:link_text, "Ape Health")
    $browser.find_element(:link_text, "Best Primate College")
    $browser.find_element(:link_text, "Elderly Care")
    $browser.find_element(:link_text, "Primate Diet")
    $browser.find_element(:link_text, "Primate Health")
    $browser.find_element(:link_text, "Primate Student of the Year")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Database").click
    expect($browser.title).to eq("Database")
    $browser.find_element(:link_text, "Primate Info").click
    expect($browser.title).to eq("Primate Info")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Grant").click
    expect($browser.title).to eq("Grant")
    $browser.find_element(:link_text, "Primate Elderly Care").click
    expect($browser.title).to eq("Primate Elderly Care")
    $browser.find_element(:link_text, "Elderly Care")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Grant").click
    expect($browser.title).to eq("Grant")
    $browser.find_element(:link_text, "Primate Habitat Research Grant").click
    expect($browser.title).to eq("Primate Habitat Research Grant")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Grant").click
    expect($browser.title).to eq("Grant")
    $browser.find_element(:link_text, "Primate Survival Planning Grant").click
    expect($browser.title).to eq("Primate Survival Planning Grant")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Human Study").click
    expect($browser.title).to eq("Human Study")
    $browser.find_element(:link_text, "Human and Ape Brain Comparison").click
    expect($browser.title).to eq("Human and Ape Brain Comparison")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Patent").click
    expect($browser.title).to eq("Patent")
    $browser.find_element(:link_text, "USA222333444555").click
    expect($browser.title).to eq("USA222333444555")
    $browser.find_element(:link_text, "Primate College of America")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Proceedings").click
    expect($browser.title).to eq("Proceedings")
    $browser.find_element(:link_text, "PHC Proceedings").click
    expect($browser.title).to eq("PHC Proceedings")
    $browser.find_element(:link_text, "Primate Health Conference")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Webpage").click
    expect($browser.title).to eq("Webpage")
    $browser.find_element(:link_text, "exact:http://primatehealthintro.cornell.edu").click
    expect($browser.title).to eq("exact:http://primatehealthintro.cornell.edu")
    $browser.find_element(:link_text, "Introduction to Primate Health")
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
  end

  it "Verify Locations" do
    $browser.find_element(:link_text, "Building").click
    expect($browser.title).to eq("Building")
    $browser.find_element(:link_text, "Jane Memorial Building").click
    expect($browser.title).to eq("Jane Memorial Building")
    $browser.find_element(:link_text, "Portable Primate Habitat")
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Room").click
    expect($browser.title).to eq("Room")
    $browser.find_element(:link_text, "Lab Admin Office").click
    expect($browser.title).to eq("Lab Admin Office")
    $browser.find_element(:link_text, "Jane Memorial Building")
  end

  it "Go back to VIVO home page" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
