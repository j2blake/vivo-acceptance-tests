require_relative 'configuration'

describe "Create People" do

  describe "Create a Faculty Member" do
    it "logs in as Admin" do
      $browser.navigate.to $vivo.vivo_url("/")
      expect($browser.title).to eq("VIVO")

      $browser.find_element(:link_text, "Log in").click
      expect($browser.title).to eq("Log in - VIVO")

      $browser.find_element(:name, "loginName").send_keys("test_admin@mydomain.edu")
      $browser.find_element(:name, "loginPassword").send_keys("Password")
      $browser.find_element(:name, "loginForm").click
      expect($browser.title).to eq("VIVO")
    end

    it "decides to add a faculty member" do
      $browser.find_element(:link_text, "Site Admin").click
      expect($browser.title).to eq("VIVO Site Administration")

      $browser.find_element(:id, "VClassURI")
      Selenium::WebDriver::Support::Select.new($browser.find_element(:id, "VClassURI")).select_by(:text, "Faculty Member (vivo)")
      $browser.find_element(:id, "submit").click
      expect($browser.title).to eq("Edit")
    end

    it "creates with the basic info" do
      $browser.find_element(:id, "firstName").send_keys("Jane")
      $browser.find_element(:id, "lastName").send_keys("Faculty")
      $browser.find_element(:id, "submit").click
      expect($browser.title).to eq("Faculty, Jane")
    end

    it "adds an overview" do
      $browser.find_element(:class, "add-overview").click
      expect($browser.title).to eq("Edit")

      $browser.execute_script("tinyMCE.activeEditor.setContent('Jane is a wonderful professor')");
      $browser.find_element(:id, "submit").click
      expect($browser.title).to eq("Faculty, Jane")
      expect($browser.find_element(:tag_name, "body").text).to include("wonderful professor")
    end

    it "adds a preferred title" do
      $browser.find_element(:css, "section#preferredTitle a.add-ARG_2000028").click
      expect($browser.title).to eq("Edit")
      expect($browser.find_element(:tag_name, "body").text).to include("preferred title for")

      $browser.find_element(:id, "preferredTitle").send_keys("Associate Professor")
      $browser.find_element(:id, "submit").click
      expect($browser.title).to eq("Faculty, Jane")
      expect($browser.find_element(:tag_name, "body").text).to include("Associate Professor")
    end

    it "finds the faculty member on the home page" do
      $vivo.wait_for_indexing
      
      $browser.find_element(:link_text, "Home").click
      expect($browser.title).to eq("VIVO")

      $selenium.wait_for_jQuery
      $browser.find_element(:link_text, "Faculty, Jane")

      expect($browser.find_element(:id, "research-faculty-mbrs").text).to include("Associate Professor")
    end

    it "logs out" do
      admin_menu = $browser.find_element(:link_text, "Admin")
      $browser.action.move_to(admin_menu).perform
      $browser.find_element(:link_text, "Log out").click
      expect($browser.title).to eq("VIVO")
    end
  end

  describe "Create a Librarian" do
    it "logs in as Admin" do
      $browser.navigate.to $vivo.vivo_url("/")
      expect($browser.title).to eq("VIVO")

      $browser.find_element(:link_text, "Log in").click
      expect($browser.title).to eq("Log in - VIVO")

      $browser.find_element(:name, "loginName").send_keys("test_admin@mydomain.edu")
      $browser.find_element(:name, "loginPassword").send_keys("Password")
      $browser.find_element(:name, "loginForm").click
      expect($browser.title).to eq("VIVO")
    end

    it "decides to add a librarian" do
      $browser.find_element(:link_text, "Site Admin").click
      expect($browser.title).to eq("VIVO Site Administration")

      $browser.find_element(:id, "VClassURI")
      Selenium::WebDriver::Support::Select.new($browser.find_element(:id, "VClassURI")).select_by(:text, "Librarian (vivo)")
      $browser.find_element(:id, "submit").click
      expect($browser.title).to eq("Edit")
      expect($browser.find_element(:tag_name, "body").text).to include("Create a new Librarian")
    end

    it "creates with the basic info" do
      $browser.find_element(:id, "firstName").send_keys("Lily")
      $browser.find_element(:id, "middleName").send_keys("Lou")
      $browser.find_element(:id, "lastName").send_keys("Librarian")
      $browser.find_element(:id, "submit").click
      expect($browser.title).to eq("Librarian, Lily Lou")
    end

    it "adds a preferred title" do
      $browser.find_element(:css, "section#preferredTitle a.add-ARG_2000028").click
      expect($browser.title).to eq("Edit")
      expect($browser.find_element(:tag_name, "body").text).to include("preferred title for")

      $browser.find_element(:id, "preferredTitle").send_keys("Assistant Librarian")
      $browser.find_element(:id, "submit").click
      expect($browser.title).to eq("Librarian, Lily Lou")

      expect($browser.find_element(:tag_name, "body").text).to include("Librarian, Lily Lou")
      expect($browser.find_element(:tag_name, "body").text).to include("Assistant Librarian")
    end

    it "finds the librarian and the faculty member in the index" do
      $vivo.wait_for_indexing

      $browser.find_element(:link_text, "Index").click
      expect($browser.title).to eq("Index of Contents")

      $browser.find_element(:link_text, "Faculty Member")
      expect($browser.find_element(:tag_name, "body").text).to include("Faculty Member (1)")
      $browser.find_element(:link_text, "Librarian")
      expect($browser.find_element(:tag_name, "body").text).to include("Librarian (1)")
      $browser.find_element(:link_text, "Person")
      expect($browser.find_element(:tag_name, "body").text).to include("Person (2)")
    end
    
    it "inspects the index of librarians" do
      $browser.find_element(:link_text, "Librarian").click
      expect($browser.title).to eq("Librarian")

      $browser.find_element(:link_text, "Librarian, Lily Lou")
      expect($browser.find_element(:tag_name, "body").text).to include("Librarian, Lily Lou Assistant Librarian")
    end
    
    it "searches for the librarian" do
      $browser.find_element(:name, "querytext").send_keys("librarian")
      $browser.find_element(:css, "#search-field > input.search").click
      expect($browser.title).to eq("VIVO - Search results for 'librarian'")
      
      expect($browser.find_element(:tag_name, "body").text).to include("Search results for 'librarian'")
      $browser.find_element(:link_text, "Librarian, Lily Lou")
      expect($browser.find_element(:tag_name, "body").text).to include("Librarian, Lily Lou Assistant Librarian")
    end
    
    it "follows the home page link to People browsing page" do
      $browser.find_element(:link_text, "Home").click
      expect($browser.title).to eq("VIVO")

      $selenium.wait_for_jQuery
      expect($browser.find_element(:tag_name, "body").text).to include("No research content found.")
      $browser.find_element(:link_text, "View all ...").click
      expect($browser.title).to eq("People")

#      $selenium.wait_for_jQuery
      $browser.find_element(:link_text, "Person (2)").click
    end
    
    it "examines the entries for the librarian and the faculty member" do
      $selenium.wait_for_jQuery
      $browser.find_element(:link_text, "Faculty, Jane")
      expect($browser.find_element(:tag_name, "body").text).to include("Associate Professor")

      $browser.find_element(:link_text, "Librarian, Lily Lou")
      expect($browser.find_element(:tag_name, "body").text).to include("Assistant Librarian")
    end

    it "logs out" do
      admin_menu = $browser.find_element(:link_text, "Admin")
      $browser.action.move_to(admin_menu).perform
      $browser.find_element(:link_text, "Log out").click
      expect($browser.title).to eq("VIVO")
    end
  end
end

=begin
=end