shared_examples "Add Publications: Publication Display" do
  it "Change publications to display" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
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

  it "Verify publications exist" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    expect(browser_page_text).to include("Too Much Nintendo.  Child Development.  29:298-344. 2010")
    expect(browser_page_text).to include("Nintendo: Good or Bad for Kids?.  New York: Putnam. 2010")
    expect(browser_page_text).to include("Nintendo O.K. for Kids.  Kids in the 21st Century. Ed. Sony, Sunny.  New York: Marcel Dekker. 765-876.")
    expect(browser_page_text).to include("Nintendo Case Studies.  Games and Child Development. 2010")
  end

  it "Select display none" do
    $browser.find_element(:id, "managePubLink").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Manage Publications for Frank Furter")
    $browser.find_element(:css, "input.itemCheckbox").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[2]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[3]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[4]").click
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Verify publications are gone" do
    expect(browser_page_text).not_to include("Too Much Nintendo.  Child Development.  29:298-344. 2010")
    expect(browser_page_text).not_to include("Nintendo: Good or Bad for Kids?.  New York: Putnam. 2010")
    expect(browser_page_text).not_to include("Nintendo O.K. for Kids.  Kids in the 21st Century. Ed. Sony, Sunny.  New York: Marcel Dekker. 765-876.")
    expect(browser_page_text).not_to include("Nintendo Case Studies.  Games and Child Development. 2010")
  end

  it "Opt to display 2 publications" do
    expect(browser_page_text).to include("manage publications")
    $browser.find_element(:id, "managePubLink").click
    expect($browser.title).to eq("VIVO")
    expect(browser_page_text).to include("Too Much Nintendo")
    expect(browser_page_text).to include("Nintendo: Good or Bad for Kids?")
    expect(browser_page_text).to include("Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Nintendo Case Studies")
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[4]").click
    $browser.find_element(:css, "input.itemCheckbox").click
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Verify only 2 publications are showing" do
    expect(browser_page_text).to include("Too Much Nintendo.  Child Development.  29:298-344. 2010")
    expect(browser_page_text).not_to include("Nintendo: Good or Bad for Kids?.  New York: Putnam. 2010")
    expect(browser_page_text).not_to include("Nintendo O.K. for Kids.  Kids in the 21st Century. Ed. Sony, Sunny.  New York: Marcel Dekker. 765-876.")
    expect(browser_page_text).to include("Nintendo Case Studies.  Games and Child Development. 2010")
  end

  it "Now display them all again" do
    expect(browser_page_text).to include("manage publications")
    $browser.find_element(:id, "managePubLink").click
    expect($browser.title).to eq("VIVO")
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[2]").click
    $browser.find_element(:xpath, "(.//input[@type='checkbox'])[3]").click
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Verify publications all display again" do
    expect(browser_page_text).to include("Too Much Nintendo.  Child Development.  29:298-344. 2010")
    expect(browser_page_text).to include("Nintendo: Good or Bad for Kids?.  New York: Putnam. 2010")
    expect(browser_page_text).to include("Nintendo O.K. for Kids.  Kids in the 21st Century. Ed. Sony, Sunny.  New York: Marcel Dekker. 765-876.")
    expect(browser_page_text).to include("Nintendo Case Studies.  Games and Child Development. 2010")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
