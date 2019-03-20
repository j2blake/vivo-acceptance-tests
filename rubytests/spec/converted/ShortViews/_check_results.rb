shared_examples "Short Views: Check Results" do
  it "Check short view results" do
  end

  it "Must be logged off to start" do
  end

  it "Must login as the site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
  end

  it "Check Index view of Faculty member" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    expect(browser_page_text).to include("Faculty Member")
    expect(browser_page_text).to include("Baker, Able Professor")
    $browser.find_element(:link_text, "Baker, Able")
    expect(browser_page_text).to include("Dog, Charlie Member of Department A")
    $browser.find_element(:link_text, "Dog, Charlie")
    $browser.find_element(:link_text, "Foxtrot, Echo")
    expect(browser_page_text).to include("Foxtrot, Echo Member of Department B")
    $browser.find_element(:link_text, "Henry, George")
    expect(browser_page_text).to include("Henry, George")
    expect(browser_page_text).not_to include("Jenkins, Iris")
    expect($browser.find_elements(:link_text, "Jenkins, Iris").size).to eq(0)
  end

  it "Check Index view of Person" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Person").click
    expect($browser.title).to eq("Person")
    expect(browser_page_text).to include("Person")
    expect(browser_page_text).to include("Baker, Able Professor")
    $browser.find_element(:link_text, "Baker, Able")
    expect(browser_page_text).to include("Dog, Charlie Faculty Member Member of Department A")
    $browser.find_element(:link_text, "Dog, Charlie")
    expect(browser_page_text).to include("Foxtrot, Echo Faculty Member Member of Department B")
    $browser.find_element(:link_text, "Foxtrot, Echo")
    expect(browser_page_text).to include("Henry, George Faculty Member")
    $browser.find_element(:link_text, "Henry, George")
    expect(browser_page_text).to include("Jenkins, Iris")
    $browser.find_element(:link_text, "Jenkins, Iris")
  end

  it "Check Browse view of Faculty Member" do
    $browser.find_element(:link_text, "People").click
    expect($browser.title).to eq("People")
    $browser.find_element(:link_text, "Faculty Member (4)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Baker, Able")
    expect(browser_page_text).to include("Professor")
    $browser.find_element(:link_text, "Dog, Charlie")
    expect(browser_page_text).to include("Member of Department A")
    $browser.find_element(:link_text, "Foxtrot, Echo")
    expect(browser_page_text).to include("Member of Department B")
    $browser.find_element(:link_text, "Henry, George")
    expect(browser_page_text).to include("Henry, George")
    expect($browser.find_elements(:link_text, "Jenkins, Iris").size).to eq(0)
    expect(browser_page_text).not_to include("Jenkins, Iris")
  end

  it "Check Browse view of Person" do
    $browser.find_element(:link_text, "Person (5)").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Baker, Able")
    expect(browser_page_text).to include("Professor")
    $browser.find_element(:link_text, "Dog, Charlie")
    expect(browser_page_text).to include("Faculty Member")
    expect(browser_page_text).to include("Member of Department A")
    $browser.find_element(:link_text, "Foxtrot, Echo")
    expect(browser_page_text).to include("Faculty Member")
    expect(browser_page_text).to include("Member of Department B")
    $browser.find_element(:link_text, "Henry, George")
    expect(browser_page_text).to include("Faculty Member")
    $browser.find_element(:link_text, "Jenkins, Iris")
    expect(browser_page_text).to include("Jenkins, Iris")
  end

  it "Search for Person" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("person")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("Search for 'person'")
    expect(browser_page_text).to include("Search results for 'person'")
    expect(browser_page_text).to include("Dog, Charlie Faculty Member Member of Department A")
    $browser.find_element(:link_text, "Dog, Charlie")
    expect(browser_page_text).to include("Baker, Able Professor")
    $browser.find_element(:link_text, "Baker, Able")
    expect(browser_page_text).to include("Foxtrot, Echo Faculty Member Member of Department B")
    $browser.find_element(:link_text, "Foxtrot, Echo")
    expect(browser_page_text).to include("Jenkins, Iris Person")
    $browser.find_element(:link_text, "Jenkins, Iris")
    expect(browser_page_text).to include("Henry, George Faculty Member")
    $browser.find_element(:link_text, "Henry, George")
  end

  it "Check Index view of Academic Department" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Academic Department").click
    expect($browser.title).to eq("Academic Department")
    expect(browser_page_text).to include("Academic Department")
    expect(browser_page_text).to include("Department A Located in Building A")
    $browser.find_element(:link_text, "Department A")
    expect(browser_page_text).to include("Department B Headed by Foxtrot, Echo")
    $browser.find_element(:link_text, "Department B")
  end

  it "Check Index view of Organization" do
    $browser.find_element(:link_text, "Index").click
    expect($browser.title).to eq("Index of Contents")
    $browser.find_element(:link_text, "Organization").click
    expect($browser.title).to eq("Organization")
    expect(browser_page_text).to include("Organization")
    expect(browser_page_text).to include("Department A Academic Department Located in Building A")
    $browser.find_element(:link_text, "Department A")
    expect(browser_page_text).to include("Department B Academic Department Headed by Foxtrot, Echo")
    $browser.find_element(:link_text, "Department B")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
