shared_examples "Add Publications: Add Book" do
  it "Add Book" do
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
    expect(browser_page_text).not_to include("Book")
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

  it "Select to add a book" do
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Book")
    expect(browser_page_text).to include("Title")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:id, "publisher").clear
    $browser.find_element(:id, "publisher").send_keys("Putnam")
    $browser.find_element(:id, "locale").clear
    $browser.find_element(:id, "locale").send_keys("New York")
    $browser.find_element(:id, "dateTime-year").clear
    $browser.find_element(:id, "dateTime-year").send_keys("2010")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
    expect(browser_page_text).to include("book")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?")
    expect(browser_page_text).to include("Nintendo: Good or Bad for Kids?.  New York: Putnam. 2010")
  end

  it "Go back to the book" do
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?").click
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
  end

  it "Add details for Book" do
    $browser.find_element(:xpath, ".//h3[@id='status']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "in press")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:xpath, ".//h3[@id='hasSubjectArea']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:link_text, "Select or create a VIVO-defined concept.").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "relatedIndLabel").clear
    $browser.find_element(:id, "relatedIndLabel").send_keys("Child Development")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Children")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Games")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:xpath, ".//h3[@id='isbn10']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("5555555555")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:xpath, ".//h3[@id='isbn13']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("7777777777777")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:xpath, ".//h3[@id='numPages']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("258")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
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
    expect(browser_page_text).to include("Person (1)")
    $browser.find_element(:link_text, "Person")
    expect(browser_page_text).to include("Organization (1)")
    $browser.find_element(:link_text, "Organization")
    expect(browser_page_text).to include("Publisher (1)")
    $browser.find_element(:link_text, "Publisher")
    expect(browser_page_text).to include("research")
    expect(browser_page_text).to include("Book (1)")
    $browser.find_element(:link_text, "Book")
    expect(browser_page_text).to include("Concept (1)")
    $browser.find_element(:link_text, "Concept")
  end

  it "Verify Book shows up for Frank Furter" do
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
    expect(browser_page_text).to include("book")
    expect(browser_page_text).to include("Nintendo: Good or Bad for Kids?.  New York: Putnam. 2010")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?")
  end

  it "Verify book details" do
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?").click
    expect($browser.title).to eq("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    $browser.find_element(:link_text, "Furter, Frank")
    $browser.find_element(:link_text, "Child Development")
    expect(browser_page_text).to include("2010")
    expect(browser_page_text).to include("5555555555")
    expect(browser_page_text).to include("7777777777777")
    expect(browser_page_text).to include("258")
    $browser.find_element(:link_text, "Putnam")
    expect(browser_page_text).to include("New York")
    $browser.find_element(:link_text, "in press")
    expect(browser_page_text).to include("Children")
    expect(browser_page_text).to include("Games")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
