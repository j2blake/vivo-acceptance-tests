shared_examples "Create People: Search Faculty Info" do
  it "Search data from *FacultyInfo test cases" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Do not login" do
  end

  it "Let the searching begin" do
  end

  it "Search for APE" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("ape")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'ape'")
    expect(browser_page_text).to include("Search results for 'ape'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "events")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "research")
    $browser.find_element(:link_text, "Ape Week")
    expect(browser_page_text).to include("Ape Week Newsletter")
    $browser.find_element(:link_text, "Apes on Parade")
    expect(browser_page_text).to include("Apes on Parade Performance")
    $browser.find_element(:link_text, "Ape Trainer of the Decade")
    expect(browser_page_text).to include("Ape Trainer of the Decade Award or Honor")
    $browser.find_element(:link_text, "Variety of Apes in Africa")
    expect(browser_page_text).to include("Variety of Apes in Africa Conference Poster")
    $browser.find_element(:link_text, "Professional Ape Trainer Association")
    expect(browser_page_text).to include("Professional Ape Trainer Association Organization")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
  end

  it "Search for PRIMATE" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("primate")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'primate'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "activities")
    $browser.find_element(:link_text, "events")
    $browser.find_element(:link_text, "research")
    $browser.find_element(:link_text, "Primate Experts")
    expect(browser_page_text).to include("Primate Experts License")
    $browser.find_element(:link_text, "Primate Feeding")
    expect(browser_page_text).to include("Primate Feeding Training Service")
    $browser.find_element(:link_text, "Primate Reactions")
    expect(browser_page_text).to include("Primate Reactions Case Study")
    $browser.find_element(:link_text, "Primate Feeding")
    expect(browser_page_text).to include("Primate Feeding Concept")
    $browser.find_element(:link_text, "African Primates")
    expect(browser_page_text).to include("African Primates Concept")
    $browser.find_element(:link_text, "Licensed Primate Instructor")
    expect(browser_page_text).to include("Licensed Primate Instructor License")
    $browser.find_element(:link_text, "Licensed Primate Expert")
    expect(browser_page_text).to include("Licensed Primate Expert License")
    $browser.find_element(:link_text, "Primate Expert Association")
    expect(browser_page_text).to include("Primate Expert Association Credential")
    $browser.find_element(:link_text, "Primates of East Africa")
    expect(browser_page_text).to include("Primates of East Africa Exhibit")
    $browser.find_element(:link_text, "Primates-R-Us Fellowship")
    expect(browser_page_text).to include("Primates-R-Us Fellowship Concept")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
  end

  it "Search for CHIMP" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("chimp")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'chimp'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "research")
    $browser.find_element(:link_text, "Chimp Lover for Life")
    expect(browser_page_text).to include("Chimp Lover for Life Award or Honor")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
  end

  it "Search for TARZAN" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("tarzan")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'tarzan'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
  end

  it "Search for MOZAMBIQUE" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("mozamia")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'mozamia'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "locations")
    $browser.find_element(:link_text, "Mozamia")
    expect(browser_page_text).to include("Mozamia County")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
  end

  it "Search for HUMAN" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("human")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    expect($browser.title).to eq("VIVO - Search results for 'human'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
  end

  it "Search for FEEDING" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("feeding")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "activities")
    $browser.find_element(:link_text, "research")
    $browser.find_element(:link_text, "Primate Feeding")
    expect(browser_page_text).to include("Primate Feeding Training Service")
    $browser.find_element(:link_text, "JF Feeding")
    expect(browser_page_text).to include("JF Feeding Technique")
    $browser.find_element(:xpath, "(.//a[contains(text(),'Primate Feeding')])[2]")
    expect(browser_page_text).to include("Primate Feeding Concept")
    $browser.find_element(:link_text, "JF Feeding Revised")
    expect(browser_page_text).to include("JF Feeding Revised Technique")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
  end

  it "Search for ADAMS" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("adams")
    $browser.find_element(:xpath, ".//input[@value='Search']").click
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "research")
    $browser.find_element(:link_text, "Adams, John")
    expect(browser_page_text).to include("Adams, John Faculty Member Emeritus")
    $browser.find_element(:link_text, "Adams, Amy")
    expect(browser_page_text).to include("Adams, Amy Person")
    $browser.find_element(:link_text, "Primate Feeding")
    expect(browser_page_text).to include("Primate Feeding Concept")
    $browser.find_element(:link_text, "Faculty, Jane")
    expect(browser_page_text).to include("Faculty, Jane Assistant Professor")
  end

  it "Go to VIVO homepage" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
    end
  end
