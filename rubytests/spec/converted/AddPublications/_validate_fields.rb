shared_examples "Add Publications: Validate Fields" do
  it "Add Book Chapter to validate fields" do
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
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[4]").click
  end

  it "Select to add a Publication" do
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
    expect(browser_page_text).to include("Title")
    expect(browser_page_text).to include("Publication Date")
  end

  it "Cancel out before doing anything" do
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Select to add a Publication again" do
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
    expect(browser_page_text).to include("Title")
    expect(browser_page_text).to include("Publication Date")
  end

  it "Select to add a book chapter" do
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Chapter")
  end

  it "Cancel out before entering in title" do
    $browser.find_element(:link_text, "Cancel").click
  end

  it "Select to add an book chapter again, this time without a title" do
    $browser.find_element(:css, "#relatedBy-Authorship > a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
    expect(browser_page_text).to include("Title")
    expect(browser_page_text).to include("Publication Date")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Chapter")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
    expect(browser_page_text).to include("Title")
    expect(browser_page_text).to include("Published in")
    expect(browser_page_text).to include("Editor: Last name")
    expect(browser_page_text).to include("First name")
    expect(browser_page_text).to include("Publisher")
    expect(browser_page_text).to include("Place of Publication")
    expect(browser_page_text).to include("Volume")
    expect(browser_page_text).to include("Chapter")
    expect(browser_page_text).to include("Start Page")
    expect(browser_page_text).to include("End Page")
    expect(browser_page_text).to include("Publication Date")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Please select an existing publication in the Title field or enter a new one.")
  end

  it "Select to add a Book Chapter again, this time do it right" do
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create publication entry for Furter, Frank")
    expect(browser_page_text).to include("Publication Type")
    browser_find_select_list(:id, "typeSelector").select_by(:text, "Chapter")
    expect(browser_page_text).to include("Title")
    $browser.find_element(:id, "title").clear
    $browser.find_element(:id, "title").send_keys("Nintendo O.K. for Kids")
    $browser.find_element(:id, "book").clear
    $browser.find_element(:id, "book").send_keys("Raising Children in the 21st Century")
    $browser.find_element(:id, "editor").clear
    $browser.find_element(:id, "editor").send_keys("Mouse")
    $browser.find_element(:id, "firstName").clear
    $browser.find_element(:id, "firstName").send_keys("Minnie")
    $browser.find_element(:id, "publisher").clear
    $browser.find_element(:id, "publisher").send_keys("Marcel Dekker")
    $browser.find_element(:id, "locale").clear
    $browser.find_element(:id, "locale").send_keys("New York")
    $browser.find_element(:id, "volume").clear
    $browser.find_element(:id, "volume").send_keys("1")
    $browser.find_element(:id, "chapterNbr").clear
    $browser.find_element(:id, "chapterNbr").send_keys("15")
    $browser.find_element(:id, "startPage").clear
    $browser.find_element(:id, "startPage").send_keys("123")
    $browser.find_element(:id, "endPage").clear
    $browser.find_element(:id, "endPage").send_keys("144")
    $browser.find_element(:id, "dateTime-year").clear
    $browser.find_element(:id, "dateTime-year").send_keys("2009")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Verify author info is there" do
    expect(browser_page_text).to include("chapter")
    expect(browser_page_text).to include("Nintendo O.K. for Kids.  Raising Children in the 21st Century. Ed. Mouse, Minnie.  New York: Marcel Dekker. 123-144. 2009")
    $browser.find_element(:link_text, "Nintendo O.K. for Kids")
  end

  it "Add Image, validating field first" do
    $browser.find_element(:link_text, "Nintendo O.K. for Kids").click
    $browser.find_element(:css, "img.add-individual").click
    expect($browser.title).to eq("Upload image for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Photo Upload")
    expect(browser_page_text).to include("Current Photo")
    expect(browser_page_text).to include("Upload a photo (JPEG, GIF or PNG)")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//img[@alt='add']").click
    expect($browser.title).to eq("Upload image for Nintendo O.K. for Kids")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("nintendo-logo.jpg", __FILE__))
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//img[@alt='add']").click
    expect($browser.title).to eq("Upload image for Nintendo O.K. for Kids")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("nintendo-logo.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Nintendo O.K. for Kids")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//img[@alt='add']").click
    expect($browser.title).to eq("Upload image for Nintendo O.K. for Kids")
    $browser.find_element(:id, "datafile").clear
    $browser.find_element(:id, "datafile").send_keys(tester_filepath("nintendo-logo.jpg", __FILE__))
    $browser.find_element(:xpath, ".//input[@value='Upload photo']").click
    expect($browser.title).to eq("Crop image for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Photo Upload")
    $browser.find_element(:css, "input.submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add Web Page, validating field first" do
    $browser.find_element(:css, "a.add-ARG_2000028 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Manage Web Pages")
    expect(browser_page_text).to include("This individual currently has no web pages specified. Add a new web page by clicking on the button below.")
    $browser.find_element(:id, "showAddFormButton").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add webpage for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("URL Type")
    expect(browser_page_text).to include("URL")
    expect(browser_page_text).to include("Webpage Name")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("url: This field must not be empty.")
    browser_find_select_list(:name, "urlType").select_by(:text, "Standard Web Link")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("url: This field must not be empty.")
    $browser.find_element(:id, "url").clear
    $browser.find_element(:id, "url").send_keys("http://www.nintendo.com/")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Manage Web Pages")
    $browser.find_element(:link_text, "Edit").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Company Homepage")
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "returnToIndividual").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add Author, validating field first" do
    $browser.find_element(:css, "a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Manage Authors")
    expect(browser_page_text).to include("Furter, Frank")
    $browser.find_element(:id, "returnLink").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:css, "a.add-relatedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "showAddFormButton").click
    expect(browser_page_text).to include("Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Manage Authors")
    expect(browser_page_text).to include("Furter, Frank")
    expect(browser_page_text).to include("Add an Author")
    expect(browser_page_text).to include("Last name")
    expect(browser_page_text).to include("First name")
    expect(browser_page_text).to include("Middle name")
    $browser.find_element(:link_text, "Cancel").click
    $browser.find_element(:id, "showAddFormButton").click
    expect(browser_page_text).to include("Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Manage Authors")
    expect(browser_page_text).to include("Furter, Frank")
    expect(browser_page_text).to include("Add an Author")
    expect(browser_page_text).to include("Last name")
    expect(browser_page_text).to include("First name")
    expect(browser_page_text).to include("Middle name")
    $browser.find_element(:id, "lastName").send_keys("Mous")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    vivo_click_and_wait_for_indexing(:id, "submit")
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "returnLink").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Furter, Frank")
    expect(browser_page_text).to include("Mouse, Minnie")
  end

  it "Add Features, validating field first" do
    $browser.find_element(:css, "a.add-features > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    expect(browser_page_text).to include("This relates an information resource to a person it features.")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='features']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    expect(browser_page_text).to include("This relates an information resource to a person it features.")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Mouse, Minnie (Person)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Mouse, Minnie  Person")
    $browser.find_element(:css, "a[title=\"name\"]")
  end

  it "Add Abstract, validating field first" do
    $browser.find_element(:xpath, ".//h3[@id='abstract']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: abstract")
    expect(browser_page_text).to include("A summary of the resource.")
    $browser.find_element(:link_text, "Cancel").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='abstract']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_fill_tinyMCE("This is a chapter in a book that provides various professional viewpoints as to the impact of Nintendo usage on kids.")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add Presented At, validating field first" do
    $browser.find_element(:xpath, ".//h3[@id='presentedAt']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("There are no entries in the system from which to select.")
    expect(browser_page_text).to include("Please create a new entry.")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='presentedAt']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("There are no entries in the system from which to select.")
    expect(browser_page_text).to include("Please create a new entry.")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Conference (bibo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create \"presented at event\" entry for Nintendo O.K. for Kids")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Focus on Kids!")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add Status, validating field first" do
    $browser.find_element(:xpath, ".//h3[@id='status']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add an entry of type status")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='status']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add an entry of type status")
    browser_find_select_list(:id, "objectVar").select_by(:text, "published")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:css, "a.add-status > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "published")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add Has Part, validating field first" do
    $browser.find_element(:css, "a.add-BFO_0000051 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:css, "a.add-BFO_0000051 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Select an existing document for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Chapter (bibo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Kids Now Conference Proceedings")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add Part Of, validating field first" do
    $browser.find_element(:css, "a.add-BFO_0000050 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:css, "a.add-BFO_0000050 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Book (bibo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Nintendo: Good or Bad for Kids?")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add Domestic Geo Focus, validating field first" do
    $browser.find_element(:xpath, ".//h3[@id='geographicFocus']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    expect(browser_page_text).to include("Geographic Region Name")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='geographicFocus']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    expect(browser_page_text).to include("Geographic Region Name")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:id, "object").send_keys("United States of Am")
    browser_wait_for_jQuery
    $browser.find_element(:css, ".ui-menu-item-wrapper").click
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add OCLCNUM validating field first" do
    $browser.find_element(:xpath, ".//li[@groupname='identity']").click
    $browser.find_element(:xpath, ".//h3[@id='oclcnum']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: Online Computer Library Center (OCLC) number")
    expect(browser_page_text).to include("An oclcnum is a sequential accession number assigned by OCLC as bibliographic records are entered into OCLC WorldCat (the OCLC Online Union Catalog).")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='oclcnum']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: Online Computer Library Center (OCLC) number")
    expect(browser_page_text).to include("An oclcnum is a sequential accession number assigned by OCLC as bibliographic records are entered into OCLC WorldCat (the OCLC Online Union Catalog).")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("1234-5678-90")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add PMID, validating field first" do
    $browser.find_element(:xpath, ".//h3[@id='pmid']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: PubMed ID")
    expect(browser_page_text).to include("A PMID (PubMed Identifier or PubMed Unique Identifier) is a unique number assigned to each PubMed citation of life sciences and biomedical scientific journal articles.")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='pmid']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: PubMed ID")
    expect(browser_page_text).to include("A PMID (PubMed Identifier or PubMed Unique Identifier) is a unique number assigned to each PubMed citation of life sciences and biomedical scientific journal articles.")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("123456789")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add Number of Pages, validating field first" do
    vivo_select_tab_on_profile('additional_document_info')
    $browser.find_element(:xpath, ".//h3[@id='numPages']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: number of pages")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='numPages']/a/img").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("22")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add Subject Area, validating field first" do
    vivo_select_tab_on_profile('overview')
    $browser.find_element(:xpath, ".//h3[@id='hasSubjectArea']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Manage Concepts")
    expect(browser_page_text).to include("There are currently no concepts specified.")
    $browser.find_element(:link_text, "Return to Profile Page")
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='hasSubjectArea']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Manage Concepts")
    expect(browser_page_text).to include("There are currently no concepts specified.")
    $browser.find_element(:link_text, "Return to Profile Page")
    $browser.find_element(:id, "showAddFormButton").click
    $browser.find_element(:link_text, "Select or create a VIVO-defined concept.").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create Your Own Concept")
    expect(browser_page_text).to include("Concept")
    $browser.find_element(:link_text, "Return to Manage Concepts")
    $browser.find_element(:id, "relatedIndLabel").clear
    $browser.find_element(:id, "relatedIndLabel").send_keys("Child Development")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Manage Concepts")
    expect(browser_page_text).to include("Concept (Type)")
    expect(browser_page_text).to include("Vocabulary Source")
    expect(browser_page_text).to include("Child Development")
    $browser.find_element(:link_text, "Remove")
    $browser.find_element(:link_text, "Return to Profile Page")
    $browser.find_element(:link_text, "Return to Profile Page").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add Keywords, validating field first" do
    vivo_select_tab_on_profile('research')
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: keywords")
    expect(browser_page_text).to include("Intended for a word or short phrase only where no instance of a controlled vocabulary can be identified. Can also be used to help in highlighting subtle difference in work.")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='freetextKeyword']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Add new entry for: keywords")
    expect(browser_page_text).to include("Intended for a word or short phrase only where no instance of a controlled vocabulary can be identified. Can also be used to help in highlighting subtle difference in work.")
    $browser.find_element(:id, "literal").clear
    $browser.find_element(:id, "literal").send_keys("Children")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add Reproduced In, validating field first" do
    vivo_select_tab_on_profile('additional_document_info')
    $browser.find_element(:xpath, ".//h3[@id='reproducedIn']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:xpath, ".//h3[@id='reproducedIn']/a/img").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Nintendo: Good or Bad for Kids? (Book)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add Reproduces, validating field first" do
    $browser.find_element(:xpath, ".//h3[@id='reproduces']/a/img").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:css, "a.add-reproduces").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Kids Now Conference Proceedings (Chapter)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add documentation for" do
    vivo_select_tab_on_profile('overview')
    $browser.find_element(:css, "a.add-documentationFor > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).not_to include("Select an existing (Instrument or Service or Reagent or Research Project or Biological Specimen or Software or Database) for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("There are no entries in the system from which to select.")
    expect(browser_page_text).to include("Please create a new entry.")
    $browser.find_element(:link_text, "Cancel")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:css, "a.add-documentationFor > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).not_to include("Select an existing (Instrument or Service or Reagent or Research Project or Biological Specimen or Software or Database) for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("There are no entries in the system from which to select.")
    expect(browser_page_text).to include("Please create a new entry.")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Service (obo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Focus on Kids Project")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add has global citation frequency" do
    vivo_select_tab_on_profile('additional_document_info')
    $browser.find_element(:css, "a.add-hasGlobalCitationFrequency > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).not_to include("Select an existing Global Citation Count for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("There are no entries in the system from which to select.")
    expect(browser_page_text).to include("Please create a new entry.")
    $browser.find_element(:link_text, "Cancel")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:css, "a.add-hasGlobalCitationFrequency > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).not_to include("Select an existing Global Citation Count for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("There are no entries in the system from which to select.")
    expect(browser_page_text).to include("Please create a new entry.")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("99")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add presented at" do
    vivo_select_tab_on_profile('overview')
    $browser.find_element(:css, "a.add-presentedAt > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).not_to include("Select an existing Event for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("There are no entries in the system from which to select.")
    expect(browser_page_text).to include("Please create a new entry.")
    $browser.find_element(:link_text, "Cancel")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create \"presented at event\" entry for Nintendo O.K. for Kids")
    $browser.find_element(:link_text, "Cancel")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:css, "a.add-presentedAt > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).not_to include("Select an existing Event for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("There are no entries in the system from which to select.")
    expect(browser_page_text).to include("Please create a new entry.")
    $browser.find_element(:link_text, "Cancel")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create \"presented at event\" entry for Nintendo O.K. for Kids")
    $browser.find_element(:link_text, "Cancel")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Focus on Kids Too!")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add part of" do
    $browser.find_element(:css, "a.add-RO_0002353 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).not_to include("Select an existing Process for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:link_text, "Cancel")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:css, "a.add-RO_0002353 > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "objectVar").select_by(:text, "Focus on Kids! (Conference)")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Add cited by" do
    vivo_select_tab_on_profile('related_documents')
    $browser.find_element(:css, "a.add-citedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Select an existing document for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:link_text, "Cancel")
    $browser.find_element(:link_text, "Cancel").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:css, "a.add-citedBy > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Select an existing document for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:link_text, "Cancel")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Academic Article (bibo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:link_text, "Cancel")
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Create \"cited by\" entry for Nintendo O.K. for Kids")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Kids Today")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "cites" do
    $browser.find_element(:css, "a.add-cites > img.add-individual").click
    expect($browser.title).to eq("Edit")
    expect(browser_page_text).to include("Select an existing document for Nintendo O.K. for Kids")
    expect(browser_page_text).to include("If you don't find the appropriate entry on the selection list above:")
    $browser.find_element(:link_text, "Cancel")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Academic Article (bibo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Kids of the 21st Century")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
    $browser.find_element(:css, "a.add-cites > img.add-individual").click
    expect($browser.title).to eq("Edit")
    browser_find_select_list(:id, "typeOfNew").select_by(:text, "Academic Article (bibo)")
    $browser.find_element(:id, "offerCreate").click
    expect($browser.title).to eq("Edit")
    $browser.find_element(:id, "label").clear
    $browser.find_element(:id, "label").send_keys("Children Today")
    $browser.find_element(:id, "submit").click
    expect($browser.title).to eq("Nintendo O.K. for Kids")
  end

  it "Verify all fields display properly" do
    $browser.find_element(:link_text, "Company Homepage")
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[12]").click
    expect(browser_page_text).to include("This is a chapter in a book that provides various professional viewpoints as to the impact of Nintendo usage on kids.")
    $browser.find_element(:link_text, "Furter, Frank")
    $browser.find_element(:link_text, "Mouse, Minnie")
    $browser.find_element(:css, "a[title=\"editor name\"]")
    $browser.find_element(:link_text, "published")
    expect(browser_page_text).to include("2009")
    $browser.find_element(:link_text, "Marcel Dekker")
    $browser.find_element(:link_text, "Child Development")
    $browser.find_element(:link_text, "Kids Now Conference Proceedings")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?")
    expect(browser_page_text).to include("15")
    expect(browser_page_text).to include("Mouse, Minnie  Person")
    $browser.find_element(:link_text, "Mouse, Minnie")
    $browser.find_element(:link_text, "Raising Children in the 21st Century")
    $browser.find_element(:link_text, "United States of America")
    $browser.find_element(:link_text, "Focus on Kids Project")
    $browser.find_element(:link_text, "Focus on Kids!")
    $browser.find_element(:link_text, "Focus on Kids Too!")
    $browser.find_element(:css, "#presentedAt-Event-List > li > a[title=\"name\"]")
    $browser.find_element(:css, "#RO_0002353-BFO_0000015-List > li > a[title=\"name\"]")
    expect(browser_page_text).to include("Children")
    $browser.find_element(:link_text, "Kids Today")
    $browser.find_element(:link_text, "Children Today")
    $browser.find_element(:link_text, "Kids of the 21st Century")
    expect(browser_page_text).to include("1234-5678-90")
    expect(browser_page_text).to include("123456789")
    $browser.find_element(:link_text, "99")
    expect(browser_page_text).to include("22")
    expect(browser_page_text).to include("123")
    expect(browser_page_text).to include("144")
    expect(browser_page_text).to include("1")
    expect(browser_page_text).to include("New York")
    $browser.find_element(:link_text, "Nintendo: Good or Bad for Kids?")
    $browser.find_element(:link_text, "Kids Now Conference Proceedings")
  end

  it "Verify Index is correct" do
    vivo_wait_for_indexing
    $browser.find_element(:link_text, "Index").click
    expect(browser_page_text).to include("people")
    expect(browser_page_text).to include("Faculty Member (1)")
    expect(browser_page_text).to include("Person (2)")
    expect(browser_page_text).to include("activities")
    expect(browser_page_text).to include("Service (1)")
    expect(browser_page_text).to include("events")
    expect(browser_page_text).to include("Competition (1)")
    expect(browser_page_text).to include("Conference (1)")
    expect(browser_page_text).to include("Event (2)")
    expect(browser_page_text).to include("organizations")
    expect(browser_page_text).to include("Organization (1)")
    expect(browser_page_text).to include("Publisher (1)")
    expect(browser_page_text).to include("research")
    expect(browser_page_text).to include("Academic Article (3)")
    expect(browser_page_text).to include("Article (3)")
    expect(browser_page_text).to include("Book (2)")
    expect(browser_page_text).to include("Chapter (2)")
    expect(browser_page_text).to include("Concept (1)")
    expect(browser_page_text).to include("Global Citation Count (1)")
  end

  it "Navigate back to Frank Furter" do
    $browser.find_element(:link_text, "Index").click
    $browser.find_element(:link_text, "Faculty Member").click
    expect($browser.title).to eq("Faculty Member")
    $browser.find_element(:link_text, "Furter, Frank").click
    expect($browser.title).to eq("Furter, Frank")
  end

  it "Verify Book Chapter is there" do
    $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[4]").click
    # #<tr><td>pause</td><td>5000</td><td></td></tr>
    expect(browser_page_text).to include("chapter")
    $browser.find_element(:link_text, "Nintendo O.K. for Kids")
    expect(browser_page_text).to include("Nintendo O.K. for Kids.  Raising Children in the 21st Century. Ed. Mouse, Minnie.  New York: Marcel Dekker. 123-144. 2009")
  end

  it "Logout" do
    $browser.find_element(:link_text, "Home").click
    vivo_logout
    expect($browser.title).to eq("VIVO")
    end
  end
