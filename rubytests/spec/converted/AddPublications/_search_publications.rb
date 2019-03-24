shared_examples "Add Publications: Search Publications" do
  it "Search for publications-related items" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Must not be logged in" do
  end

  it "Search for NINTENDO" do
    vivo_wait_for_indexing
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("nintendo")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'nintendo'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "events")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "research")
    expect(browser_page_text).to include("Too Much Nintendo Academic Article")
    $browser.find_element(:link_text, "Too Much Nintendo")
    expect(browser_page_text).to include("Nintendo Case Studies Conference Paper")
    $browser.find_element(:link_text, "Nintendo Case Studies")
    expect(browser_page_text).to include("Nintendo: Good or Bad for Kids? Book")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?")
    expect(browser_page_text).to include("Nintendo O.K. for Kids Chapter")
    $browser.find_element(:link_text, "Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Child Development Concept")
    $browser.find_element(:link_text, "Child Development")
    expect(browser_page_text).to include("Games and Child Development Conference")
    $browser.find_element(:link_text, "Games and Child Development")
    expect(browser_page_text).to include("Putnam Publisher")
    $browser.find_element(:link_text, "Putnam")
    expect(browser_page_text).to include("Child Development Journal")
    $browser.find_element(:link_text, "Child Development")
    expect(browser_page_text).to include("Marcel Dekker Publisher")
    $browser.find_element(:link_text, "Marcel Dekker")
    expect(browser_page_text).to include("Kids in the 21st Century Book")
    $browser.find_element(:link_text, "Kids in the 21st Century")
    expect(browser_page_text).to include("Furter, Frank Associate Professor")
    $browser.find_element(:link_text, "Furter, Frank")
  end

  it "Search for CHILD DEVELOPMENT" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("child development")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'child development'")
    $browser.find_element(:link_text, "events")
    $browser.find_element(:link_text, "research")
    expect(browser_page_text).to include("Child Development Journal")
    $browser.find_element(:link_text, "Child Development")
    expect(browser_page_text).to include("Child Development Concept")
    $browser.find_element(:link_text, "Child Development")
    expect(browser_page_text).to include("Nintendo Case Studies Conference Paper")
    $browser.find_element(:link_text, "Nintendo Case Studies")
    expect(browser_page_text).to include("Games and Child Development Conference")
    $browser.find_element(:link_text, "Games and Child Development")
    expect(browser_page_text).to include("Too Much Nintendo Academic Article")
    $browser.find_element(:link_text, "Too Much Nintendo")
    expect(browser_page_text).to include("Nintendo: Good or Bad for Kids? Book")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?")
    expect(browser_page_text).to include("Nintendo O.K. for Kids Chapter")
    $browser.find_element(:link_text, "Nintendo O.K. for Kids")
  end

  it "Search for CHILDREN" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("children")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'children'")
    $browser.find_element(:link_text, "research")
    expect(browser_page_text).to include("Nintendo: Good or Bad for Kids? Book")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?")
    expect(browser_page_text).to include("Nintendo Case Studies Conference Paper")
    $browser.find_element(:link_text, "Nintendo Case Studies")
    expect(browser_page_text).to include("Nintendo O.K. for Kids Chapter")
    $browser.find_element(:link_text, "Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Too Much Nintendo Academic Article")
    $browser.find_element(:link_text, "Too Much Nintendo")
  end

  it "Search for GAMES" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("games")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'games'")
    $browser.find_element(:link_text, "events")
    $browser.find_element(:link_text, "research")
    expect(browser_page_text).to include("Games and Child Development Conference")
    $browser.find_element(:link_text, "Games and Child Development")
    expect(browser_page_text).to include("Nintendo Case Studies Conference Paper")
    $browser.find_element(:link_text, "Nintendo Case Studies")
    expect(browser_page_text).to include("Nintendo: Good or Bad for Kids? Book")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?")
    expect(browser_page_text).to include("Nintendo O.K. for Kids Chapter")
    $browser.find_element(:link_text, "Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Too Much Nintendo Academic Article")
    $browser.find_element(:link_text, "Too Much Nintendo")
  end

  it "Search for CONFERENCE" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("conference")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'conference'")
    $browser.find_element(:link_text, "events")
    $browser.find_element(:link_text, "research")
    expect(browser_page_text).to include("Games and Child Development Conference")
    $browser.find_element(:link_text, "Games and Child Development")
    expect(browser_page_text).to include("Nintendo Case Studies Conference Paper")
    $browser.find_element(:link_text, "Nintendo Case Studies")
  end

  it "All done" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
