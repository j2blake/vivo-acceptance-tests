shared_examples "Linked Open Data: Test User Created" do
  it "Check that the user has been created" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
    $browser.navigate.to vivo_url("/display/lodFacultyMember")
  end

  it "Check out profile page for Mr. Bad Example" do
    expect($browser.title).to eq("Example, Bad")
    expect(browser_page_text).to include("Faculty Member")
    expect(browser_page_text).to include("Not someone on whom you should base your actions.")
    $browser.find_element(:link_text, "Slashdot")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
    $browser.find_element(:link_text, "Department of Redundancy Department")
    expect(browser_page_text).to include("Department of Redundancy Department Bozo 1992 -")
    expect(browser_page_text).to include("Mr. Bad Example")
    expect(browser_page_text).to include("My_eRA_ID")
    $browser.find_element(:link_text, "10982375409")
    vivo_logout
    $browser.navigate.to vivo_url("/")
    end
  end
