shared_examples "Add Roles: Grant Display" do
  it "Change grants to display" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Navigate to Jane Faculty" do
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Faculty, Jane").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify grants exist" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
    expect(browser_page_text).to include("NIH VIVO Too 2010 -")
    expect(browser_page_text).to include("NIH VIVO 2009 - 2010")
    expect(browser_page_text).to include("VIVO Cornell Grant 2007 - 2009")
    expect(browser_page_text).to include("VIVO Cornell Grant Too 2009")
    expect(browser_page_text).to include("History of Apes in Africa Consultant 2010 -")
    expect(browser_page_text).to include("Habitats for Apes Researcher 1980 - 1985")
  end

  it "Select display none" do
    expect(browser_page_text).to include("manage grants & projects")
    $browser.find_element(:id, "manageGrantLink").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("NIH VIVO")
    expect(browser_page_text).to include("VIVO Cornell Grant")
    expect(browser_page_text).to include("VIVO Cornell Grant Too")
    expect(browser_page_text).to include("NIH VIVO Too")
    expect(browser_page_text).to include("Habitats for Apes")
    expect(browser_page_text).to include("History of Apes in Africa")
    $browser.find_element(:css, "input.itemCheckbox").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[2]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[3]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[4]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[5]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[6]").click
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify grants are gone" do
    expect(browser_page_text).not_to include("History of Apes in Africa Consultant 2010 -")
    expect(browser_page_text).not_to include("Habitats for Apes Researcher 1980 - 1985")
    expect(browser_page_text).not_to include("NIH VIVO Too 2010 -")
    expect(browser_page_text).not_to include("NIH VIVO 2009 - 2010")
    expect(browser_page_text).not_to include("VIVO Cornell Grant 2007 - 2009")
    expect(browser_page_text).not_to include("VIVO Cornell Grant Too 2009")
  end

  it "Opt to display 3 grants" do
    $browser.find_element(:link_text, "manage grants & projects")
    $browser.find_element(:id, "manageGrantLink").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[4]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[2]").click
    $browser.find_element(:css, "input.itemCheckbox").click
    $browser.find_element(:link_text, "Return to Profile Page").click
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify only 3 grants are showing" do
    expect(browser_page_text).not_to include("History of Apes in Africa Consultant 2010 -")
    expect(browser_page_text).not_to include("Habitats for Apes Researcher 1980 - 1985")
    expect(browser_page_text).to include("NIH VIVO Too 2010 -")
    expect(browser_page_text).to include("NIH VIVO 2009 - 2010")
    expect(browser_page_text).to include("VIVO Cornell Grant 2007 - 2009")
    expect(browser_page_text).not_to include("VIVO Cornell Grant Too 2009")
  end

  it "Now display them all again" do
    expect(browser_page_text).to include("manage grants & projects")
    $browser.find_element(:id, "manageGrantLink").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[3]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[5]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[6]").click
    $browser.find_element(:link_text, "Return to Profile Page").click
    # #<tr><td>pause</td><td>10000</td><td></td></tr>
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify grants all display again" do
    expect(browser_page_text).to include("History of Apes in Africa Consultant 2010 -")
    expect(browser_page_text).to include("Habitats for Apes Researcher 1980 - 1985")
    expect(browser_page_text).to include("NIH VIVO Too 2010 -")
    expect(browser_page_text).to include("NIH VIVO 2009 - 2010")
    expect(browser_page_text).to include("VIVO Cornell Grant 2007 - 2009")
    expect(browser_page_text).to include("VIVO Cornell Grant Too 2009")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
