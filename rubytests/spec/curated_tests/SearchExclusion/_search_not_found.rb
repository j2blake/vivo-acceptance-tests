shared_examples "Search Exclusion: Search Not Found" do
  it "Search for test person" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("faculty")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("Search for 'faculty'")
    expect(browser_page_text).to include("Search for 'faculty'")
    expect(browser_page_text).to include("No matching results.")
    expect($browser.find_elements(:link_text, "people").size).to eq(0)
    expect(browser_page_text).not_to include("Faculty, Jane Assistant Professor")
    expect($browser.find_elements(:link_text, "Faculty, Jane").size).to eq(0)
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
