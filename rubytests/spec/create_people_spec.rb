require_relative 'configuration'

describe "Create People" do
  def vivo_url(page)
    "http://localhost:8080/vivo%s" % [page]
  end
  
  def wait_for_jQuery
    Selenium::WebDriver::Wait.new.until {
      $browser.execute_script("return ($.active == 0)")
    }
    sleep 1
  end

  describe "Create a Faculty Member" do
    it "logs in" do
      $browser.navigate.to vivo_url("/")
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
      expect($browser.find_element(:tag_name, "body").text).to include("Data Input")

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
    
    it "finds the faculty member on the home page" do
      $browser.find_element(:link_text, "Home").click
      expect($browser.title).to eq("VIVO")

      wait_for_jQuery
      $browser.find_element(:link_text, "Faculty, Jane")
    end
    
    it "logs out" do
      admin_menu = $browser.find_element(:link_text, "Admin")
      $browser.action.move_to(admin_menu).perform
      $browser.find_element(:link_text, "Log out").click
      expect($browser.title).to eq("VIVO")
    end
  end
end
