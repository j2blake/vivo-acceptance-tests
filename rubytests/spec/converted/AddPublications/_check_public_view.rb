shared_examples "Add Publications: Check Public View" do
  it "Check public view of publications" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Must not be logged in" do
  end

  it "Navigate to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Verify 4 publications show up" do
    expect(browser_page_text).to include("academic article")
    expect(browser_page_text).to include("Too Much Nintendo.  Child Development.  29:298-344. 2010")
    $browser.find_element(:link_text, "Too Much Nintendo")
    expect(browser_page_text).to include("book")
    expect(browser_page_text).to include("Nintendo: Good or Bad for Kids?.  New York: Putnam. 2010")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?")
    expect(browser_page_text).to include("chapter")
    expect(browser_page_text).to include("Nintendo O.K. for Kids.  Kids in the 21st Century. Ed. Sony, Sunny.  New York: Marcel Dekker. 765-876.")
    $browser.find_element(:link_text, "Nintendo O.K. for Kids")
    expect(browser_page_text).to include("conference paper")
    expect(browser_page_text).to include("Nintendo Case Studies.  Games and Child Development. 2010")
    $browser.find_element(:link_text, "Nintendo Case Studies")
  end

  it "Now verify Chapter details" do
    $browser.find_element(:link_text, "Nintendo O.K. for Kids").click
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[8]").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:link_text, "Furter, Frank")
    $browser.find_element(:link_text, "Sony, Sunny")
    $browser.find_element(:link_text, "Marcel Dekker")
    $browser.find_element(:link_text, "Child Development")
    expect(browser_page_text).to include("13")
    $browser.find_element(:link_text, "Kids in the 21st Century")
    expect(browser_page_text).to include("Children")
    expect(browser_page_text).to include("Games")
    expect(browser_page_text).to include("765")
    expect(browser_page_text).to include("876")
    expect(browser_page_text).to include("New York")
  end

  it "Now verify Conference Paper details" do
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Nintendo Case Studies").click
    expect($browser.title).to eq("Nintendo Case Studies")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[6]").click
    $browser.find_element(:link_text, "Furter, Frank")
    expect(browser_page_text).to include("2010")
    $browser.find_element(:link_text, "Child Development")
    $browser.find_element(:link_text, "Games and Child Development")
    expect(browser_page_text).to include("Children")
    expect(browser_page_text).to include("Games")
  end

  it "Now verify Book details" do
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?").click
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[10]").click
    $browser.find_element(:link_text, "Furter, Frank")
    $browser.find_element(:link_text, "in press")
    expect(browser_page_text).to include("2010")
    $browser.find_element(:link_text, "Putnam")
    $browser.find_element(:link_text, "Child Development")
    expect(browser_page_text).to include("Children")
    expect(browser_page_text).to include("Games")
    expect(browser_page_text).to include("5555555555")
    expect(browser_page_text).to include("7777777777777")
    expect(browser_page_text).to include("258")
    expect(browser_page_text).to include("New York")
  end

  it "Now verify Article details" do
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:link_text, "Too Much Nintendo").click
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[10]").click
    expect($browser.title).to eq("Too Much Nintendo")
    $browser.find_element(:link_text, "Furter, Frank")
    expect(browser_page_text).to include("2010")
    $browser.find_element(:link_text, "Child Development")
    $browser.find_element(:link_text, "Child Development")
    expect(browser_page_text).to include("Children")
    expect(browser_page_text).to include("Games")
    expect(browser_page_text).to include("DEF12121212")
    expect(browser_page_text).to include("NIH9898989898")
    expect(browser_page_text).to include("PMID767676")
    expect(browser_page_text).to include("987654321.1234567890")
    expect(browser_page_text).to include("ABC111222333")
    expect(browser_page_text).to include("298")
    expect(browser_page_text).to include("344")
    expect(browser_page_text).to include("29")
    expect(browser_page_text).to include("Supplement")
  end

  it "Check front page informaton" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("1  Academic Articles")
    expect(browser_page_text).to include("2  Books")
    expect(browser_page_text).to include("1  Chapters")
    expect(browser_page_text).to include("1  Conference Papers")
    $browser.find_element(:link_text, "View all ...").click
    expect($browser.title).to eq("Research")
    $browser.find_element(:link_text, "Academic Article (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Too Much Nintendo")
    $browser.find_element(:link_text, "Article (2)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Nintendo Case Studies")
    expect(browser_page_text).to include("Conference Paper")
    $browser.find_element(:link_text, "Too Much Nintendo")
    expect(browser_page_text).to include("Academic Article")
    $browser.find_element(:link_text, "Book (2)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Kids in the 21st Century")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?")
    $browser.find_element(:link_text, "Chapter (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Nintendo O.K. for Kids")
    $browser.find_element(:link_text, "Concept (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Child Development")
    $browser.find_element(:link_text, "Conference Paper (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Nintendo Case Studies")
    $browser.find_element(:link_text, "Journal (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Child Development")
  end

  it "All done" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
