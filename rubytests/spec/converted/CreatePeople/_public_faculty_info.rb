shared_examples "Create People: Public Faculty Info" do
  it "Check what the public will see from *FacultyInfo test cases" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
  end

  it "Do not login" do
  end

  it "Check front page" do
    expect(browser_page_text).not_to include("No research found.")
    $browser.find_element(:link_text, "View all ...")
    expect(browser_page_text).not_to include("No faculty members found.")
    $browser.find_element(:link_text, "Faculty, Jane")
    $browser.find_element(:css, "a[alt=\"view all faculty\"]")
    expect(browser_page_text).to include("No academic departments found.")
  end

  it "Find Jane Faculty via Index" do
    $browser.find_element(:link_text, "Index").click
    expect(browser_page_text).to include("Faculty Member")
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    $browser.find_element(:link_text, "Faculty, Jane").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("Faculty, Jane")
  end

  it "Verify fields that should and shouldn't be present" do
    expect(browser_page_text).to include("Faculty, Jane")
    expect(browser_page_text).to include("Assistant Professor")
    expect(browser_page_text).to include("I am named after Jane in the Tarzan stories. Yes, my last name really is faculty.")
    $browser.find_element(:link_text, "African Primates")
    $browser.find_element(:link_text, "Primatia Africana")
    $browser.find_element(:link_text, "Mozamia")
    $browser.find_element(:link_text, "southern Africa")
    $browser.find_element(:link_text, "mejane@primates-r-us.com")
    $browser.find_element(:link_text, "jane@gmail.com")
    $browser.find_element(:link_text, "jfac@gmail.com")
    expect(browser_page_text).to include("607-266-6666")
    expect(browser_page_text).to include("607-288-8888")
    $browser.find_element(:link_text, "CUL Homepage")
    $browser.find_element(:link_text, "CIT Homepage")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
    $browser.find_element(:link_text, "Adams, John")
    expect(browser_page_text).to include("Adams, John   Faculty Member Emeritus")
    $browser.find_element(:link_text, "Librarian, Lily Lou")
    expect(browser_page_text).to include("Librarian, Lily Lou  Assistant Librarian")
    $browser.find_element(:link_text, "Apes on Parade")
    expect(browser_page_text).to include("Apes on Parade 1991 -")
    $browser.find_element(:link_text, "Ape Week")
    expect(browser_page_text).to include("Ape Week  (Newsletter) 1988 - 1990")
    $browser.find_element(:link_text, "Primate Reactions")
    $browser.find_element(:link_text, "USA1234567890")
    expect(browser_page_text).to include("I study apes, of course.")
    expect(browser_page_text).to include("African Apes")
    expect(browser_page_text).to include("African Primates")
    expect(browser_page_text).to include("I teach apes how to communicate with humans.")
    expect(browser_page_text).to include("postdoc or fellow advising relationship")
    $browser.find_element(:link_text, "Smith, Joe")
    expect(browser_page_text).to include("I travel the world teaching apes how to communicate with humans.")
    $browser.find_element(:link_text, "Variety of Apes in Africa")
    expect(browser_page_text).to include("Variety of Apes in Africa  (Conference Poster) 1983")
    $browser.find_element(:link_text, "Primate Feeding")
    $browser.find_element(:link_text, "Primates of East Africa")
    expect(browser_page_text).to include("Primates of East Africa 1984 -")
    $browser.find_element(:link_text, "JF Feeding")
    $browser.find_element(:link_text, "JF Feeding Revised")
    $browser.find_element(:link_text, "Licensed Primate Instructor")
    $browser.find_element(:link_text, "Primate Experts")
    $browser.find_element(:link_text, "Ape Trainer of the Decade")
    expect(browser_page_text).to include("Ape Trainer of the Decade, conferred by Professional Ape Trainer Association")
    $browser.find_element(:link_text, "Professional Ape Trainer Association")
    $browser.find_element(:link_text, "Chimp Lover for Life")
    expect(browser_page_text).to include("faculty mentoring relationship")
    $browser.find_element(:link_text, "Adams, Amy")
    expect(browser_page_text).to include("Adams, Amy, 2013 -")
    expect(browser_page_text).to include("Mrs. Jane E. Faculty, Jr.")
    expect(browser_page_text).to include("Jungle 1234")
    expect(browser_page_text).to include("Tree 99")
    expect(browser_page_text).to include("Congo City")
    expect(browser_page_text).to include("Congola State")
    expect(browser_page_text).to include("1234567890")
    expect(browser_page_text).to include("Democratic Republic of Congo")
    expect(browser_page_text).to include("CIT Cornell University")
    expect(browser_page_text).to include("Ithaca, New York  14853")
    expect(browser_page_text).to include("United States of America")
    expect(browser_page_text).to include("607-299-9999")
    expect(browser_page_text).to include("607-277-7777")
    expect($browser.find_elements(:link_text, "http://orcid.org/11111").size).to eq(0)
    expect($browser.find_elements(:link_text, "http://orcid.org/454545").size).to eq(0)
    expect(browser_page_text).to include("ABC121212")
    expect(browser_page_text).to include("ABC123987")
    expect(browser_page_text).not_to include("222222")
    expect(browser_page_text).not_to include("67676767")
    expect($browser.find_elements(:link_text, "3333333").size).to eq(0)
    expect($browser.find_elements(:link_text, "987654321").size).to eq(0)
    expect(browser_page_text).to include("2727272727272727")
    expect(browser_page_text).to include("976976976976")
  end

  it "Logout" do
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
    end
  end
