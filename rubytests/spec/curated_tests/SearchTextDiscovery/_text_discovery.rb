shared_examples "Search Text Discovery: Text Discovery" do
  it "Search Text Discovery" do
  end

  it "Must not be logged in already" do
  end

  it "Must log in as site admin" do
    vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    expect($browser.title).to eq("VIVO")
  end

  it "Label on self" do
    $browser.find_element(:link_text, "Site Admin").click
    expect($browser.title).to eq("VIVO Site Administration")
    browser_find_select_list(:id, "VClassURI").select_by(:text, "Person (foaf)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Able")
    $browser.find_element(:id, "lastName").clear
    $browser.find_element(:id, "lastName").send_keys("Baker")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.fn").text).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Person")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("baker")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'baker'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'baker'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Person")
  end

  it "Data property" do
    $browser.find_element(:link_text, "Baker, Able").click
    expect($browser.title).to eq("Baker, Able")
    $browser.find_element(:css, "a.add-overview > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("seeker of truth")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.fn").text).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Person")
    expect($browser.find_element(:css, "div.overview-value").text).to eq("seeker of truth")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("seeker")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'seeker'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'seeker'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Person")
  end

  it "Special case: preferred title" do
    $browser.find_element(:link_text, "Baker, Able").click
    expect($browser.title).to eq("Baker, Able")
    $browser.find_element(:css, "[title=\"Add new preferred title entry\"]").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "preferredTitle").clear
    $browser.find_element(:id, "preferredTitle").send_keys("Honcho")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.fn").text).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.display-title-editable").text).to eq("Honcho")
    expect($browser.find_element(:css, "div.overview-value").text).to eq("seeker of truth")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("Honcho")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'Honcho'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'Honcho'")
    expect($browser.find_element(:link_text, "people").text).to eq("people")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Honcho")
    expect($browser.find_element(:css, "strong").text).to eq("Honcho")
  end

  it "Special case: email" do
    $browser.find_element(:link_text, "Baker, Able").click
    expect($browser.title).to eq("Baker, Able")
    $browser.find_element(:css, "a.add-ARG_2000028 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "emailAddress").clear
    $browser.find_element(:id, "emailAddress").send_keys("abaker@mydomain.com")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.fn").text).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.display-title-editable").text).to eq("Honcho")
    expect($browser.find_element(:css, "div.overview-value").text).to eq("seeker of truth")
    $browser.find_element(:link_text, "abaker@mydomain.com")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("abaker")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'abaker'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'abaker'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Honcho")
    expect($browser.find_element(:css, "p.snippet").text).to eq("... [abaker@mydomain.com] ...")
  end

  it "Object property" do
    $browser.find_element(:link_text, "Baker, Able").click
    expect($browser.title).to eq("Baker, Able")
    $browser.find_element(:css, "a.add-geographicFocus > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Atlantis")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.fn").text).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.display-title-editable").text).to eq("Honcho")
    expect($browser.find_element(:css, "div.overview-value").text).to eq("seeker of truth")
    $browser.find_element(:link_text, "Atlantis")
    expect($browser.find_element(:css, "#individual-hasResearchArea > li").text).to eq("Atlantis  Continent")
    $browser.find_element(:link_text, "abaker@mydomain.com")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("atlantis")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'atlantis'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'atlantis'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "locations")
    $browser.find_element(:link_text, "Atlantis")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Continent")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[2]/span").text).to eq("Honcho")
    expect($browser.find_element(:css, "strong").text).to eq("Atlantis")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("baker")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'baker'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'baker'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "locations")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Honcho")
    $browser.find_element(:link_text, "Atlantis")
  end

  it "Object through context node: role" do
    $browser.find_element(:link_text, "Baker, Able").click
    expect($browser.title).to eq("Baker, Able")
    $browser.find_element(:xpath, "(.//img[@alt='add'])[8]").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Department")
    $browser.find_element(:id, "activity").clear
    $browser.find_element(:id, "activity").send_keys("Advanced Tinkering")
    $browser.find_element(:id, "roleLabel").clear
    $browser.find_element(:id, "roleLabel").send_keys("Burnisher")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.fn").text).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.display-title-editable").text).to eq("Honcho")
    expect($browser.find_element(:css, "div.overview-value").text).to eq("seeker of truth")
    $browser.find_element(:link_text, "Atlantis")
    expect($browser.find_element(:css, "#individual-hasResearchArea > li").text).to eq("Atlantis  Continent")
    $browser.find_element(:link_text, "abaker@mydomain.com")
    $browser.find_element(:link_text, "Advanced Tinkering")
    expect($browser.find_element(:css, "#RO_0000053-MemberRole-List > li").text).to eq("Advanced Tinkering Burnisher")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("tinkering")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'tinkering'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'tinkering'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "Advanced Tinkering")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Department")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[2]/span").text).to eq("Honcho")
    $browser.find_element(:link_text, "Advanced Tinkering")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Department")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("baker")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'baker'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'baker'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "locations")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Honcho")
    $browser.find_element(:link_text, "Advanced Tinkering")
    expect($browser.find_element(:xpath, ".//a[text()='Advanced Tinkering']/../span").text).to eq("Department")
    $browser.find_element(:link_text, "Atlantis")
    expect($browser.find_element(:xpath, ".//a[text()='Atlantis']/../span").text).to eq("Continent")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("burnisher")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'burnisher'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'burnisher'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "Advanced Tinkering")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Department")
    expect($browser.find_element(:css, "strong").text).to eq("Burnisher")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:xpath, ".//a[text()='Baker, Able ']/../span").text).to eq("Honcho")
    expect($browser.find_element(:xpath, ".//a[text()='Baker, Able ']/..//p/strong").text).to eq("Burnisher")
  end

  it "Object through standard context node" do
    $browser.find_element(:link_text, "Baker, Able").click
    expect($browser.title).to eq("Baker, Able")
    $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Academic Article")
    $browser.find_element(:css, "option[value=\"http://purl.org/ontology/bibo/AcademicArticle\"]").click
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Thoughts")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.fn").text).to eq("Baker, Able")
    expect($browser.find_element(:css, "span.display-title-editable").text).to eq("Honcho")
    expect($browser.find_element(:css, "div.overview-value").text).to eq("seeker of truth")
    $browser.find_element(:link_text, "Atlantis")
    expect($browser.find_element(:css, "#individual-hasResearchArea > li").text).to eq("Atlantis  Continent")
    $browser.find_element(:link_text, "abaker@mydomain.com")
    expect($browser.find_element(:css, "li.subclass > h3").text).to eq("academic article")
    $browser.find_element(:link_text, "Thoughts")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("thoughts")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'thoughts'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'thoughts'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "research")
    $browser.find_element(:link_text, "Thoughts")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Academic Article")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:xpath, ".//a[text()='Baker, Able ']/../span").text).to eq("Honcho")
    expect($browser.find_element(:css, "strong").text).to eq("Thoughts")
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("baker")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'baker'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'baker'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "research")
    $browser.find_element(:link_text, "locations")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Honcho")
    $browser.find_element(:link_text, "Advanced Tinkering")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[2]/span").text).to eq("Department")
    expect($browser.find_element(:css, "strong").text).to eq("Baker")
    $browser.find_element(:link_text, "Thoughts")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[3]/span").text).to eq("Academic Article")
    $browser.find_element(:link_text, "Atlantis")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[4]/span").text).to eq("Continent")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[4]/p/strong").text).to eq("Baker")
  end

  it "Change label on related object..." do
    $browser.find_element(:link_text, "Atlantis").click
    expect($browser.title).to eq("Atlantis")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "Name").clear
    $browser.find_element(:name, "Name").send_keys("Lemuria")
    vivo_click_and_wait_for_indexing(:id, "primaryAction")
    expect($browser.title).to eq("Individual Control Panel")
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "...then search for Atlantis" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("Atlantis")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("Search for 'Atlantis'")
    expect($browser.find_element(:css, "h2").text).to eq("Search for 'Atlantis'")
    expect($browser.find_element(:css, "p").text).to eq("No matching results.")
  end

  it "...then search for Lemuria" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("Lemuria")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'Lemuria'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'Lemuria'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "locations")
    $browser.find_element(:link_text, "Lemuria")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Continent")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[2]/span").text).to eq("Honcho")
    expect($browser.find_element(:css, "strong").text).to eq("Lemuria")
  end

  it "...then search for Baker" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("baker")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'baker'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'baker'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "research")
    $browser.find_element(:link_text, "locations")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Honcho")
    $browser.find_element(:link_text, "Advanced Tinkering")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[2]/span").text).to eq("Department")
    $browser.find_element(:link_text, "Thoughts")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[3]/span").text).to eq("Academic Article")
    $browser.find_element(:link_text, "Lemuria")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[4]/span").text).to eq("Continent")
  end

  it "Change label on object through context node: role..." do
    $browser.find_element(:link_text, "Advanced Tinkering").click
    expect($browser.title).to eq("Advanced Tinkering")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "Name").clear
    $browser.find_element(:name, "Name").send_keys("Advanced Puttering")
    vivo_click_and_wait_for_indexing(:id, "primaryAction")
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "...then search for tinkering" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("tinkering")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("Search for 'tinkering'")
    expect($browser.find_element(:css, "h2").text).to eq("Search for 'tinkering'")
    expect($browser.find_element(:css, "p").text).to eq("No matching results.")
  end

  it "...then search for puttering" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("puttering")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'puttering'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'puttering'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "Advanced Puttering")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Department")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[2]/span").text).to eq("Honcho")
  end

  it "...then search for baker" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("baker")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'baker'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'baker'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "research")
    $browser.find_element(:link_text, "locations")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Honcho")
    $browser.find_element(:link_text, "Thoughts")
    expect($browser.find_element(:xpath, ".//a[text()='Thoughts']/../span").text).to eq("Academic Article")
    $browser.find_element(:link_text, "Advanced Puttering")
    expect($browser.find_element(:xpath, ".//a[text()='Advanced Puttering']/../span").text).to eq("Department")
    $browser.find_element(:link_text, "Lemuria")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[4]/span").text).to eq("Continent")
  end

  it "Change label on object through standard contect node..." do
    $browser.find_element(:link_text, "Thoughts").click
    expect($browser.title).to eq("Thoughts")
    $browser.find_element(:link_text, "Edit this individual").click
    expect($browser.title).to eq("Individual Control Panel")
    $browser.find_element(:xpath, ".//input[@value='Edit This Individual']").click
    expect($browser.title).to eq("Individual Editing Form")
    $browser.find_element(:name, "Name").clear
    $browser.find_element(:name, "Name").send_keys("Musings")
    vivo_click_and_wait_for_indexing(:id, "primaryAction")
    expect($browser.title).to eq("Individual Control Panel")
  end

  it "...then search for thoughts" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("thoughts")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("Search for 'thoughts'")
    expect($browser.find_element(:css, "h2").text).to eq("Search for 'thoughts'")
    expect($browser.find_element(:css, "p").text).to eq("No matching results.")
  end

  it "...then search for musings" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("musings")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'musings'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'musings'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "research")
    $browser.find_element(:link_text, "Musings")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Academic Article")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[2]/span").text).to eq("Honcho")
  end

  it "...then search for baker" do
    $browser.find_element(:name, "querytext").clear
    $browser.find_element(:name, "querytext").send_keys("baker")
    $browser.find_element(:css, "input.search").click
    expect($browser.title).to eq("VIVO - Search results for 'baker'")
    expect($browser.find_element(:css, "h2.searchResultsHeader").text).to eq("Search results for 'baker'")
    $browser.find_element(:link_text, "people")
    $browser.find_element(:link_text, "organizations")
    $browser.find_element(:link_text, "research")
    $browser.find_element(:link_text, "locations")
    $browser.find_element(:link_text, "Baker, Able")
    expect($browser.find_element(:css, "span.display-title").text).to eq("Honcho")
    $browser.find_element(:link_text, "Advanced Puttering")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[2]/span").text).to eq("Department")
    $browser.find_element(:link_text, "Musings")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[3]/span").text).to eq("Academic Article")
    $browser.find_element(:link_text, "Lemuria")
    expect($browser.find_element(:xpath, ".//div[@id='wrapper-content']/div/ul/li[4]/span").text).to eq("Continent")
  end

  it "Log out" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
