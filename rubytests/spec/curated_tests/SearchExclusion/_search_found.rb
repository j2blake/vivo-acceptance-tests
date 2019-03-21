shared_examples "Search Exclusion: Search Found" do
  it "Search for test person" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("faculty")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'faculty'")
    expect(browser_page_text).to include("Search results for 'faculty'")
    $browser.find_element(:link_text, "people")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
    $browser.find_element(:link_text, "Faculty, Jane")
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
