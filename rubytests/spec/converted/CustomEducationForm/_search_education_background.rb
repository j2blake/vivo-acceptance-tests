shared_examples "Custom Education Form: Search Education Background" do
  it "Search for new organizations & educational backgrounds" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("carroll")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'carroll'")
    expect(browser_page_text).to include("Search results for 'carroll'")
    $browser.find_element(:link_text, "organizations")
    expect(browser_page_text).to include("Carroll University University")
    $browser.find_element(:link_text, "Carroll University")
    expect(browser_page_text).to include("Carroll College College")
    $browser.find_element(:link_text, "Carroll College")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("wisconsin")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'wisconsin'")
    expect(browser_page_text).to include("Search results for 'wisconsin'")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "locations")
    $browser.find_element(:link_text, "Wisconsin")
    expect(browser_page_text).to include("Wisconsin State or Province")
    $browser.find_element(:link_text, "University of Wisconsin")
    expect(browser_page_text).to include("University of Wisconsin University")
    $browser.find_element(:link_text, "United States of America")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[3]/span").text).to eq("Country")
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
