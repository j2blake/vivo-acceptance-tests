shared_examples "Create People: Check People Browse" do
  it "Test People rowse" do
  end

  it "Don't need to login" do
    $browser.navigate.to vivo_url("/")
  end

  it "Verify People menu option " do
    $browser.find_element(:link_text, "People").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("People")
    $browser.find_element(:link_text, "Faculty Member (1)")
    $browser.find_element(:link_text, "Librarian (1)")
    $browser.find_element(:link_text, "Person (2)")
    expect(browser_page_text).to include("Find By")
    $browser.find_element(:link_text, "Subject Area")
    $browser.find_element(:link_text, "Department")
    $browser.find_element(:link_text, "Courses")
  end

  it "Go to Faculty browse" do
    $browser.find_element(:link_text, "Faculty Member (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Jane Faculty")
    expect(browser_page_text).to include("Assistant Professor")
    $browser.find_element(:link_text, "F").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Jane Faculty")
    expect(browser_page_text).to include("Assistant Professor")
    $browser.find_element(:link_text, "All").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Jane Faculty")
    expect(browser_page_text).to include("Assistant Professor")
  end

  it "Go to Librarian browse" do
    $browser.find_element(:link_text, "Librarian (1)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Lily Librarian")
    expect(browser_page_text).to include("Assistant Librarian")
    $browser.find_element(:link_text, "L").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Lily Librarian")
    expect(browser_page_text).to include("Assistant Librarian")
    $browser.find_element(:link_text, "All").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Lily Librarian")
    expect(browser_page_text).to include("Assistant Librarian")
  end

  it "Go to Person browse" do
    $browser.find_element(:link_text, "Person (2)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Jane Faculty")
    expect(browser_page_text).to include("Assistant Professor")
    $browser.find_element(:link_text, "Lily Librarian")
    expect(browser_page_text).to include("Assistant Librarian")
    $browser.find_element(:link_text, "F").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Jane Faculty")
    expect(browser_page_text).to include("Assistant Professor")
    expect($browser.find_elements(:link_text, "Lily Librarian").size).to eq(0)
    expect(browser_page_text).not_to include("Assistant Librarian")
    $browser.find_element(:link_text, "L").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Lily Librarian")
    expect(browser_page_text).to include("Assistant Librarian")
    expect($browser.find_elements(:link_text, "Jane Faculty").size).to eq(0)
    expect(browser_page_text).not_to include("Assistant Professor")
    $browser.find_element(:link_text, "All").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Jane Faculty")
    expect(browser_page_text).to include("Assistant Professor")
    $browser.find_element(:link_text, "Lily Librarian")
    expect(browser_page_text).to include("Assistant Librarian")
  end

  it "Go back to Home" do
    $browser.find_element(:link_text, "Home").click
    expect($browser.title).to eq("VIVO")
    end
  end
