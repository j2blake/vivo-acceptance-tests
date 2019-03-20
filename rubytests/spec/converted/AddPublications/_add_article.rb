shared_examples "Add Publications: Add Article" do
  it "Add Article" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify that no articles currently exist" do
    expect(browser_page_text).not_to include("Article")
    expect(browser_page_text).not_to include("Academic Article")
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Select to add a Publication" do
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
  end

  it "Select to add an article" do
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Academic Article")
    expect(browser_page_text).to include("Title")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Too Much Nintendo")
    $browser.find_element(:id, "collection").clear
    $browser.find_element(:id, "collection").send_keys("Child Development")
    $browser.find_element(:id, "volume").clear
    $browser.find_element(:id, "volume").send_keys("29")
    $browser.find_element(:id, "issue").clear
    $browser.find_element(:id, "issue").send_keys("Supplement")
    $browser.find_element(:id, "startPage").clear
    $browser.find_element(:id, "startPage").send_keys("298")
    $browser.find_element(:id, "endPage").clear
    $browser.find_element(:id, "endPage").send_keys("344")
    $browser.find_element(:id, "dateTime-year").clear
    $browser.find_element(:id, "dateTime-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[4]").click
    expect(browser_page_text).to include("academic article")
    expect(browser_page_text).to include("Too Much Nintendo.  Child Development.  29:298-344. 2010")
    $browser.find_element(:link_text, "Too Much Nintendo")
  end

  it "Go back to article" do
    $browser.find_element(:link_text, "Too Much Nintendo").click
    expect($browser.title).to eq("Too Much Nintendo")
  end

  it "Add details for Article" do
    expect($browser.title).to eq("Too Much Nintendo")
    $browser.find_element(:xpath, ".//h3[@id='pmid']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("ABC111222333")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Too Much Nintendo")
    $browser.find_element(:xpath, ".//h3[@id='eanucc13']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("DEF12121212")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Too Much Nintendo")
    $browser.find_element(:xpath, ".//h3[@id='nihmsid']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("NIH9898989898")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Too Much Nintendo")
    $browser.find_element(:xpath, ".//h3[@id='pmcid']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("PMID767676")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Too Much Nintendo")
    $browser.find_element(:xpath, ".//h3[@id='hasSubjectArea']/a/img").click
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:link_text, "Select or create a VIVO-defined concept.").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "relatedIndLabel").send_keys("Child")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Too Much Nintendo")
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Children")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Too Much Nintendo")
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Games")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Too Much Nintendo")
    $browser.find_element(:xpath, ".//h3[@id='doi']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("987654321.1234567890")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Too Much Nintendo")
  end

  it "Naviage back to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify Article links now appear" do
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    # #<tr><td>refreshAndWait</td><td>10000</td><td></td></tr>
    expect(browser_page_text).to include("Faculty Member (1)")
    $browser.find_element(:link_text, "Faculty Member")
    expect(browser_page_text).to include("Person (1)")
    $browser.find_element(:link_text, "Person")
    expect(browser_page_text).to include("Organization (1)")
    $browser.find_element(:link_text, "Organization")
    expect(browser_page_text).to include("Publisher (1)")
    $browser.find_element(:link_text, "Publisher")
    expect(browser_page_text).to include("research")
    expect(browser_page_text).to include("Academic Article (1)")
    $browser.find_element(:link_text, "Academic Article")
    expect(browser_page_text).to include("Article (1)")
    $browser.find_element(:link_text, "Article")
    expect(browser_page_text).to include("Book (1)")
    $browser.find_element(:link_text, "Book")
    expect(browser_page_text).to include("Concept (1)")
    $browser.find_element(:link_text, "Concept")
  end

  it "Verify Article shows up for Frank Furter" do
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[4]").click
    expect(browser_page_text).to include("academic article")
    expect(browser_page_text).to include("Too Much Nintendo.  Child Development.  29:298-344. 2010")
    $browser.find_element(:link_text, "Too Much Nintendo")
  end

  it "Verify article details" do
    $browser.find_element(:link_text, "Too Much Nintendo").click
    expect($browser.title).to eq("Too Much Nintendo")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    $browser.find_element(:link_text, "Furter, Frank")
    expect(browser_page_text).to include("2010")
    $browser.find_element(:link_text, "Child Development")
    $browser.find_element(:css, "a[title=\"name\"]")
    expect(browser_page_text).to include("Children")
    expect(browser_page_text).to include("Games")
    expect(browser_page_text).to include("DEF12121212")
    expect(browser_page_text).to include("NIH9898989898")
    expect(browser_page_text).to include("PMID767676")
    expect(browser_page_text).to include("987654321.1234567890")
    expect(browser_page_text).to include("ABC111222333")
    expect(browser_page_text).to include("298")
    expect(browser_page_text).to include("344")
    expect(browser_page_text).to include("29")
    expect(browser_page_text).to include("Supplement")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
