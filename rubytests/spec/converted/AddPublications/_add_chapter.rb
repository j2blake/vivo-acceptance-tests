shared_examples "Add Publications: Add Chapter" do
  it "Add Book Chapter" do
  end

  it "Must not be logged in already" do
  end

  it "Must login as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
  end

  it "Navigate to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify that no books currently exist" do
    expect(browser_page_text).not_to include("Chapter")
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

  it "Select to add a book chapter" do
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Chapter")
    expect(browser_page_text).to include("Title")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Nintendo O.K. for Kids")
    $browser.find_element(:id, "book").clear
    $browser.find_element(:id, "book").send_keys("Kids in the 21st Century")
    $browser.find_element(:id, "editor").clear
    $browser.find_element(:id, "editor").send_keys("Sony")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Sunny")
    $browser.find_element(:id, "publisher").clear
    $browser.find_element(:id, "publisher").send_keys("Marcel Dekker")
    $browser.find_element(:id, "locale").clear
    $browser.find_element(:id, "locale").send_keys("New York")
    $browser.find_element(:id, "startPage").clear
    $browser.find_element(:id, "startPage").send_keys("765")
    $browser.find_element(:id, "endPage").clear
    $browser.find_element(:id, "endPage").send_keys("876")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    expect(browser_page_text).to include("chapter")
    expect(browser_page_text).to include("Nintendo O.K. for Kids.  Kids in the 21st Century. Ed. Sony, Sunny.  New York: Marcel Dekker. 765-876.")
    $browser.find_element(:link_text, "Nintendo O.K. for Kids")
  end

  it "Go back to Chapter" do
    $browser.find_element(:link_text, "Nintendo O.K. for Kids").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add details for Chapter" do
    $browser.find_element(:xpath, ".//h3[@id='chapter']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("13")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='hasSubjectArea']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:link_text, "Select or create a VIVO-defined concept.").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "relatedIndLabel").send_keys("Child")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "submit").click
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    
    vivo_select_tab_on_profile('research')
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Children")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Games")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Naviage back to Index" do
    $browser.find_element(:link_text, "Index").click
  end

  it "Verify Chapter link now appears" do
    expect(browser_page_text).to include("Faculty Member (1)")
    $browser.find_element(:link_text, "Faculty Member")
    expect(browser_page_text).to include("Person (2)")
    $browser.find_element(:link_text, "Person")
    expect(browser_page_text).to include("Organization (2)")
    $browser.find_element(:link_text, "Organization")
    expect(browser_page_text).to include("Publisher (2)")
    $browser.find_element(:link_text, "Publisher")
    expect(browser_page_text).to include("research")
    expect(browser_page_text).to include("Academic Article (1)")
    $browser.find_element(:link_text, "Academic Article")
    expect(browser_page_text).to include("Article (1)")
    $browser.find_element(:link_text, "Article")
    expect(browser_page_text).to include("Book (2)")
    $browser.find_element(:link_text, "Book")
    expect(browser_page_text).to include("Chapter (1)")
    $browser.find_element(:link_text, "Chapter")
    expect(browser_page_text).to include("Concept (1)")
    $browser.find_element(:link_text, "Concept")
  end

  it "Verify Chapter shows up for Frank Furter" do
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")

    vivo_select_tab_on_profile('publications')
    expect(browser_page_text).to include("chapter")
    expect(browser_page_text).to include("Nintendo O.K. for Kids.  Kids in the 21st Century. Ed. Sony, Sunny.  New York: Marcel Dekker. 765-876.")
    $browser.find_element(:link_text, "Nintendo O.K. for Kids")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
