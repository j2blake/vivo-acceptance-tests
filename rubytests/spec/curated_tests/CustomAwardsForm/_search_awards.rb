shared_examples "Custom Awards Form: Search Awards" do
  it "Search for awards" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Search for professor" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("professor")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'professor'")
    expect(browser_page_text).to include("Search results for 'professor'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "research")
    expect(browser_page_text).to include("Professor of the Decade Award or Honor")
    $browser.find_element(:link_text, "Professor of the Decade")
    expect(browser_page_text).to include("Best Professor Award or Honor")
    $browser.find_element(:link_text, "Best Professor")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
    $browser.find_element(:link_text, "Faculty, Jane")
  end

  it "Search for primate" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("primate")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'primate'")
    expect(browser_page_text).to include("Search results for 'primate'")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "research")
    expect(browser_page_text).to include("Primate Expert Award or Honor")
    $browser.find_element(:link_text, "Primate Expert")
    expect(browser_page_text).to include("Primates-R-Us Organization")
    $browser.find_element(:link_text, "Primates-R-Us")
  end

  it "Go to home page" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
