shared_examples "Create People: Search People" do
  it "Search for Jane Faculty's first name only" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("jane")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("Search for 'jane'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
  end

  it "Search for Jane Faculty's last name only" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("faculty")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("Search for 'faculty'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[2]/span").text).to eq("Assistant Librarian")
  end

  it "Search for Jane Faculty's full name" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("jane faculty")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("Search for 'jane faculty'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
  end

  it "Search for Lily Librarian's first name only" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("lily")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("Search for 'lily'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Librarian, Lily Lou Assistant Librarian")
  end

  it "Search for Lilly Librarian's last name only" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("librarian")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("Search for 'librarian'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Librarian, Lily Lou Assistant Librarian")
  end

  it "Search for Lilly Librarian's full name" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("lily librarian")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("Search for 'lily librarian'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Librarian, Lily Lou Assistant Librarian")
  end

  it "Go back to homepage" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
