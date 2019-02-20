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

    it "finds the faculty member on the home page" do
      $vivo.wait_for_indexing
      $browser.find_element(:link_text, "Home").click
      expect($browser.title).to eq("VIVO")

      $selenium.wait_for_jQuery
      $browser.find_element(:link_text, "Faculty, Jane")
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
      $browser.find_element(:css, "li[groupname=contact]").click
      $browser.find_element(:css, "h3#ARG_2000028 > a.add-ARG_2000028").click
      expect($browser.title).to eq("Edit")
      expect($browser.find_element(:tag_name, "body").text).to include("preferred title for")

      $browser.find_element(:id, "preferredTitle").send_keys("Assistant Librarian")
      $browser.find_element(:id, "submit").click
      expect($browser.title).to eq("Librarian, Lily Lou")

      expect($browser.find_element(:tag_name, "body").text).to include("Librarian, Lily Lou")
      $browser.find_element(:css, "li[groupname=contact]").click
      expect($browser.find_element(:tag_name, "body").text).to include("Assistant Librarian")
    end

  end
end

=begin
<!--Create Librarian person-->
<!--Verify that librarian was added sucessfully-->
<!--Browse for new librarian-->
<tr>
  <td>clickAndWait</td>
  <td>link=Index</td>
  <td></td>
</tr>
<tr>
  <td>verifyElementPresent</td>
  <td>link=Faculty Member</td>
  <td></td>
</tr>
<tr>
  <td>verifyTextPresent</td>
  <td>Faculty Member (1)</td>
  <td></td>
</tr>
<tr>
  <td>verifyElementPresent</td>
  <td>link=Librarian</td>
  <td></td>
</tr>
<tr>
  <td>verifyTextPresent</td>
  <td>Librarian (1)</td>
  <td></td>
</tr>
<tr>
  <td>verifyElementPresent</td>
  <td>link=Person</td>
  <td></td>
</tr>
<tr>
  <td>verifyTextPresent</td>
  <td>Person (2)</td>
  <td></td>
</tr>
<tr>
  <td>clickAndWait</td>
  <td>link=Librarian</td>
  <td></td>
</tr>
<tr>
  <td>assertTitle</td>
  <td>Librarian</td>
  <td></td>
</tr>
<tr>
  <td>verifyElementPresent</td>
  <td>link=Librarian, Lily Lou</td>
  <td></td>
</tr>
<tr>
  <td>verifyTextPresent</td>
  <td>Librarian, Lily Lou Assistant Librarian</td>
  <td></td>
</tr>
<!--Search for new librarian-->
<tr>
  <td>type</td>
  <td>querytext</td>
  <td>librarian</td>
</tr>
<tr>
  <td>clickAndWait</td>
  <td>//input[@value='Search']</td>
  <td></td>
</tr>
<tr>
  <td>assertTitle</td>
  <td>librarian - VIVO Search Results</td>
  <td></td>
</tr>
<tr>
  <td>verifyTextPresent</td>
  <td>Search results for 'librarian'</td>
  <td></td>
</tr>
<tr>
  <td>verifyElementPresent</td>
  <td>link=Librarian, Lily Lou</td>
  <td></td>
</tr>
<tr>
  <td>verifyTextPresent</td>
  <td>Librarian, Lily Lou Assistant Librarian</td>
  <td></td>
</tr>
<!--Verify front page updated-->
<tr>
  <td>clickAndWait</td>
  <td>link=Home</td>
  <td></td>
</tr>
<tr>
  <td>assertTitle</td>
  <td>VIVO</td>
  <td></td>
</tr>
<tr>
  <td>verifyTextPresent</td>
  <td>No research content found.</td>
  <td></td>
</tr>
<tr>
  <td>pause</td>
  <td>5000</td>
  <td></td>
</tr>
<tr>
  <td>verifyElementPresent</td>
  <td>link=Faculty, Jane</td>
  <td></td>
</tr>
<tr>
  <td>verifyElementPresent</td>
  <td>link=View all ...</td>
  <td></td>
</tr>
<tr>
  <td>clickAndWait</td>
  <td>link=View all ...</td>
  <td></td>
</tr>
<tr>
  <td>assertTitle</td>
  <td>People</td>
  <td></td>
</tr>
<tr>
  <td>click</td>
  <td>link=Person (2)</td>
  <td></td>
</tr>
<tr>
  <td>pause</td>
  <td>10000</td>
  <td></td>
</tr>
<tr>
  <td>verifyElementPresent</td>
  <td>link=Faculty, Jane</td>
  <td></td>
</tr>
<tr>
  <td>verifyTextPresent</td>
  <td>Assistant Professor</td>
  <td></td>
</tr>
<tr>
  <td>verifyElementPresent</td>
  <td>link=Librarian, Lily Lou</td>
  <td></td>
</tr>
<tr>
  <td>verifyTextPresent</td>
  <td>Assistant Librarian</td>
  <td></td>
</tr>
<!--Logout-->
<tr>
  <td>clickAndWait</td>
  <td>link=Home</td>
  <td></td>
</tr>
<tr>
  <td>clickAndWait</td>
  <td>link=Log out</td>
  <td></td>
</tr>
<tr>
  <td>assertTitle</td>
  <td>VIVO</td>
  <td></td>
</tr>
</tbody></table>
</body>
</html>

=end