shared_examples "Add Publications: Add Conference" do
  it "Add Conference Paper" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify that no conference papers currently exist" do
    expect(browser_page_text).not_to include("Conference")
    expect(browser_page_text).not_to include("Conference Paper")
  end

  it "Navigate to Frank Furter" do
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Select to add a Publication" do
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
  end

  it "Select to add a conference paper" do
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Conference Paper")
    expect(browser_page_text).to include("Title")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Nintendo Case Studies")
    $browser.find_element(:id, "conference").clear
    $browser.find_element(:id, "conference").send_keys("Games and Child Development")
    $browser.find_element(:id, "dateTime-year").clear
    $browser.find_element(:id, "dateTime-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    expect(browser_page_text).to include("conference paper")
    expect(browser_page_text).to include("Nintendo Case Studies.  Games and Child Development. 2010")
    $browser.find_element(:link_text, "Nintendo Case Studies")
  end

  it "Go back to conference" do
    $browser.find_element(:link_text, "Nintendo Case Studies").click
    expect($browser.title).to eq("Nintendo Case Studies")
  end

  it "Add details for Conference Paper" do
    $browser.find_element(:xpath, ".//h3[@id='hasSubjectArea']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:link_text, "Select or create a VIVO-defined concept.").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "relatedIndLabel").send_keys("Child")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Nintendo Case Studies")
    
    vivo_select_tab_on_profile('research')
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Children")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo Case Studies")
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Games")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo Case Studies")
  end

  it "Naviage back to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify Book link now appears" do
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
    expect(browser_page_text).to include("Person (2)")
    $browser.find_element(:link_text, "Person")
    expect(browser_page_text).to include("Conference (1)")
    $browser.find_element(:link_text, "Conference")
    expect(browser_page_text).to include("Event (1)")
    $browser.find_element(:link_text, "Event")
    expect(browser_page_text).to include("Organization (2)")
    $browser.find_element(:link_text, "Organization")
    expect(browser_page_text).to include("Publisher (2)")
    $browser.find_element(:link_text, "Publisher")
    expect(browser_page_text).to include("research")
    expect(browser_page_text).to include("Academic Article (1)")
    $browser.find_element(:link_text, "Academic Article")
    expect(browser_page_text).to include("Article (2)")
    $browser.find_element(:link_text, "Article")
    expect(browser_page_text).to include("Book (2)")
    $browser.find_element(:link_text, "Book")
    expect(browser_page_text).to include("Chapter (1)")
    $browser.find_element(:link_text, "Chapter")
    expect(browser_page_text).to include("Concept (1)")
    $browser.find_element(:link_text, "Concept")
    expect(browser_page_text).to include("Conference Paper (1)")
    $browser.find_element(:link_text, "Conference Paper")
    expect(browser_page_text).to include("Journal (1)")
    $browser.find_element(:link_text, "Journal")
  end

  it "Verify Conference Paper shows up for Frank Furter" do
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    expect(browser_page_text).to include("conference paper")
    expect(browser_page_text).to include("Nintendo Case Studies.  Games and Child Development. 2010")
    $browser.find_element(:link_text, "Nintendo Case Studies")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
