shared_examples "Custom Advises Form: Search Advises" do
  it "Search for advises" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Search for advices" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("advises")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'advises'")
    expect(browser_page_text).to include("Search results for 'advises'")
    $browser.find_element(:link_text, "research")
    $browser.find_element(:link_text, "Primates")
    $browser.find_element(:link_text, "Primate Health")
  end

  it "Search for primate" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("primate")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'primate'")
    expect(browser_page_text).to include("Search results for 'primate'")
    $browser.find_element(:link_text, "research")
    expect(browser_page_text).to include("Primates Concept")
    expect(browser_page_text).to include("Primate Health Concept")
    $browser.find_element(:link_text, "Primates")
    $browser.find_element(:link_text, "Primate Health")
  end

  it "Go to home page" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
