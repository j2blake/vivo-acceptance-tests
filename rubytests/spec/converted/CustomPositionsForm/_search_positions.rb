shared_examples "Custom Positions Form: Search Positions" do
  it "Search for positions and organizations" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Search for lecturer" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("lecturer")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'lecturer'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'lecturer'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "Carroll College")
    expect($browser.find_element(:css, "span.display-title").text).to eq("College")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[2]/span").text).to eq("Assistant Professor")
  end

  it "Search for professor, which should bring up Assistant Professor and Professor" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("professor")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'professor'")
    expect(browser_page_text).to include("Search results for 'professor'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor")
    $browser.find_element(:link_text, "Carroll University")
    expect(browser_page_text).to include("University")
    $browser.find_element(:link_text, "Cornell University")
    expect(browser_page_text).to include("University")
  end

  it "Search for Carroll, which should bring up 2 organizations" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("carroll")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'carroll'")
    expect(browser_page_text).to include("Search results for 'carroll'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "Carroll College")
    expect(browser_page_text).to include("Carroll College College")
    $browser.find_element(:link_text, "Carroll University")
    expect(browser_page_text).to include("Carroll University University")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[3]/span").text).to eq("Assistant Professor")
  end

  it "Link to Carroll College to verify Jane Faculty is not listed" do
    $browser.find_element(:link_text, "Carroll College").click
    expect($browser.title).to eq("Carroll College")
    expect($browser.find_elements(:link_text, "Faculty, Jane").size).to eq(0)
    expect(browser_page_text).not_to include("Faculty, Jane, Lecturer 1977 - 1981")
  end

  it "Search for university to find both Carroll and Cornell" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("university")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'university'")
    expect(browser_page_text).to include("Search results for 'university'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "Cornell University")
    expect(browser_page_text).to include("Carroll University University")
    $browser.find_element(:link_text, "Carroll University")
    expect(browser_page_text).to include("Cornell University University")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[3]/span").text).to eq("Assistant Professor")
    $browser.find_element(:link_text, "Faculty, Jane")
  end

  it "Make sure Jane Faculty is associated with Carroll and Cornell" do
    $browser.find_element(:link_text, "Carroll University").click
    expect($browser.title).to eq("Carroll University")
    expect($browser.find_elements(:link_text, "Faculty, Jane").size).to eq(0)
    expect(browser_page_text).not_to include("Faculty, Jane, Lecturer 1977 - 1981")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("university")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    $browser.find_element(:link_text, "Cornell University").click
    expect($browser.title).to eq("Cornell University")
    expect(browser_page_text).to include("Affiliation")
    expect(browser_page_text).to include("people")
    expect(browser_page_text).to include("faculty position")
    expect(browser_page_text).to include("Faculty, Jane , Professor 1986 -")
    $browser.find_element(:link_text, "Faculty, Jane")
  end

  it "Go to home page" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
