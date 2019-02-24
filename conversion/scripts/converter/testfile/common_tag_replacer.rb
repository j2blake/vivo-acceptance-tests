require("cgi")

module Converter
  module Testfile
    class CommonTagReplacer
      def initialize(contents)
        @contents = contents.each_line.reduce("") do |buffer, line|
          @line = line.chomp
          replace_assert_title()
          
          replace_click_css
          replace_click_id
          replace_click_xpath
          replace_click
          
          replace_click_and_wait_css
          replace_click_and_wait_id
          replace_click_and_wait_link
          replace_click_and_wait_xpath
          replace_click_and_wait
          
          replace_open
          
          replace_select_id
          replace_select_name
          replace_select
          
          replace_tinymce
          
          replace_type_id()
          replace_type()
          
          replace_verify_element_present_css()
          replace_verify_element_present_link()
          replace_verify_element_present_id()
          
          replace_verify_text_present()
          
          buffer += @line + "\n"
          # notice that replace_xxx must appear after the qualified versions: replace_xxx_css, etc. or it will swallow all of them
          # should we use a more rigorous system of specifying elements? 
          #
          #     #<tr><td>type</td><td>url</td><td>http://mannlib.cornell.edu</td></tr>
          # don't know if url is id or name
          #
          #    #<tr><td>sendKeys</td><td>id=object</td><td>Afri</td></tr>
          # something like:     $browser.find_element(id: "object").send_keys("Afri")
          #
          #     #<tr><td>sendKeys</td><td>id=object</td><td>${KEY_DOWN}</td></tr>
          # something like:     $browser.find_element(id: "object").send_keys(Selenium::WebDriver::Keys.down)
          #
          # pause
          #
          #     #<tr><td>clickAndWait</td><td>xpath=(//img[@alt='add'])[29]</td><td></td></tr>
          # Is this another valid syntax? In the existing one, we just look for "<td>//".
          # How can we add the leading period without losing generalization?
          #
          # <tr><td>assertConfirmation</td><td>Are you SURE you want to delete this individual? If in doubt, CANCEL.</td><td></td></tr>
          # <tr><td>waitForPageToLoad</td><td>10000</td><td></td></tr>
          # Becomes (according to https://stackoverflow.com/questions/10178584/what-would-be-webdriver-equivalent-for-assertconfirmation)
          #   final String text = "Are you sure you want to logout?";
          #   assertTrue(driver.switchTo().alert().getText().equals(text));
          
          #
          # Actually, this is also what the official docs recommend: "findElement should not be used to look for non-present elements, use findElements(By) and assert zero length response instead."
        end
      end

      #
      # <tr><td>assertTitle</td><td>Faculty, Jane</td><td></td></tr>
      #   becomes
      # expect($browser.title).to eq("Faculty, Jane")
      #
      def replace_assert_title()
        @line.match %r{.*<td>assertTitle</td><td>(.+?)</td>.*} do |m|
          @line = "expect($browser.title).to eq(\"%s\")" % [ value(m[1]) ]
        end
      end

      #
      # <tr><td>click</td><td>_delete</td><td></td></tr>
      #   becomes
      # $browser.find_element(:name, "_delete").click
      #
      def replace_click()
        @line.match %r{.*<td>click</td><td>(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:name, \"%s\").click" % [ value(m[1]) ]
        end
      end

      #
      # <tr><td>click</td><td>css=li.nonSelectedGroupTab.clickable</td><td></td></tr>
      #   becomes
      # $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
      #
      def replace_click_css()
        @line.match %r{.*<td>click</td><td>css=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:css, \"%s\").click" % [ value(m[1]) ]
        end
      end

      #
      # <tr><td>click</td><td>id=showAddFormButton</td><td></td></tr>
      #   becomes
      # $browser.find_element(:id, "showAddFormButton").click
      #
      def replace_click_id()
        @line.match %r{.*<td>click</td><td>id=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:id, \"%s\").click" % [ value(m[1]) ]
        end
      end

      #
      # <tr><td>click</td><td>//div[@id='wrapper-content']/ul/li[18]</td><td></td></tr>
      #   becomes
      # $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
      #
      def replace_click_xpath()
        @line.match %r{.*<td>click</td><td>//(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:xpath, \".//%s\").click" % [ value(m[1]) ]
        end
      end

      #
      # <tr><td>clickAndWait</td><td>submit</td><td></td></tr>
      #   becomes
      # $browser.find_element(:name, "submit").click
      #
      def replace_click_and_wait()
        @line.match %r{.*<td>clickAndWait</td><td>(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:name, \"%s\").click" % [ value(m[1]) ]
        end
      end

      #
      # <tr><td>clickAndWait</td><td>css=a.add-assigneeFor &gt; img.add-individual</td><td></td></tr>
      #   becomes
      # $browser.find_element(:css, "a.add-assigneeFor > img.add-individual").click
      #
      def replace_click_and_wait_css()
        @line.match %r{.*<td>clickAndWait</td><td>css=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:css, \"%s\").click" % [ value(m[1]) ]
        end
      end

      #
      # <tr><td>clickAndWait</td><td>id=submit</td><td></td></tr>
      #   becomes
      # $browser.find_element(:id, "submit").click
      #
      def replace_click_and_wait_id()
        @line.match %r{.*<td>clickAndWait</td><td>id=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:id, \"%s\").click" % [ value(m[1]) ]
        end
      end

      #
      # <tr><td>clickAndWait</td><td>link=Index</td><td></td></tr>
      #   becomes
      # $browser.find_element(:link_text, "Index").click
      #
      def replace_click_and_wait_link()
        @line.match %r{.*<td>clickAndWait</td><td>link=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:link_text, \"%s\").click" % [ value(m[1]) ]
        end
      end

      #
      # <tr><td>clickAndWait</td><td>//h2[@id='hasResearchArea']/a/img</td><td></td></tr>
      #   becomes
      # $browser.find_element(:xpath, "//h2[@id='hasResearchArea']/a/img").click
      #
      def replace_click_and_wait_xpath()
        @line.match %r{.*<td>clickAndWait</td><td>//(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:xpath, \".//%s\").click" % [ value(m[1]) ]
        end
      end

      #
      # #<tr><td>open</td><td>/vivo/</td><td></td></tr>
      #   becomes
      # $browser.navigate.to vivo_url("/")
      #
      def replace_open()
        @line.match %r{.*<td>open</td><td>/vivo(.+?)</td>.*} do |m|
          @line = "$browser.navigate.to vivo_url(\"%s\")" % [ value(m[1]) ]
        end
      end

      #
      # <tr><td>select</td><td>typeSelector</td><td>label=Academic Article</td></tr>
      #   becomes
      # browser_find_select_list(:name, "typeSelector").select_by(:text, "Academic Article")
      #
      def replace_select()
        @line.match %r{.*<td>select</td><td>(.+?)</td><td>label=(.+?)</td>.*} do |m|
          @line = "browser_find_select_list(:name, \"%s\").select_by(:text, \"%s\"))" % [ value(m[1]), value(m[2]) ]
        end
      end

      #
      # <tr><td>select</td><td>id=typeSelector</td><td>label=License</td></tr>
      #   becomes
      # browser_find_select_list(:id, "typeSelector").select_by(:text, "License")
      #
      def replace_select_id()
        @line.match %r{.*<td>select</td><td>id=(.+?)</td><td>label=(.+?)</td>.*} do |m|
          @line = "browser_find_select_list(:id, \"%s\").select_by(:text, \"%s\"))" % [ value(m[1]), value(m[2]) ]
        end
      end

      #
      # <tr><td>select</td><td>name=urlType</td><td>label=Standard Web Link</td></tr>
      #   becomes
      # browser_find_select_list(:name, "urlType").select_by(:text, "Standard Web Link")
      #
      def replace_select_name()
        @line.match %r{.*<td>select</td><td>name=(.+?)</td><td>label=(.+?)</td>.*} do |m|
          @line = "browser_find_select_list(:name, \"%s\").select_by(:text, \"%s\"))" % [ value(m[1]), value(m[2]) ]
        end
      end

      #
      # <tr><td>runScript</td><td>tinyMCE.activeEditor.setContent('I study monkeys.')</td><td></td></tr>
      #   becomes
      # browser_fill_tinyMCE('I study monkeys')
      #
      def replace_tinymce()
        @line.match %r{.*<td>tinyMCE.activeEditor.setContent\((.*)\)</td>.*} do |m|
          @line = "browser_fill_tinyMCE(%s)" % [ value(m[1]) ]
        end
      end

      #
      #<tr><td>type</td><td>loginName</td><td>testAdmin@cornell.edu</td></tr>
      #   becomes
      # $browser.find_element(:name, "loginName").send_keys("testAdmin@cornell.edu")
      #
      def replace_type()
        @line.match %r{.*td>type</td><td>(.+?)</td><td>(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:name, \"%s\").send_keys(\"%s\")" % [ value(m[1]), value(m[2]) ]
        end
      end

      #
      # <tr><td>type</td><td>id=advisor</td><td>Adams</td></tr>
      #   becomes
      # $browser.find_element(:id, "advisor").send_keys("Adams")
      #
      def replace_type_id()
        @line.match %r{.*<td>type</td><td>id=(.+?)</td><td>(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:id, \"%s\").send_keys(\"%s\")" % [ value(m[1]), value(m[2]) ]
        end
      end

      #
      # <tr><td>verifyElementPresent</td><td>css=a[title=&quot;name&quot;]</td><td></td></tr>
      #   becomes
      # $browser.find_element(:css, "a[title=\"name\"]")
      #
      # NOTE: do we need to test for URL instead?
      #     :xpath, ".//a[@href='https://mail.google.com']"
      #
      def replace_verify_element_present_css()
        @line.match %r{.*<td>verifyElementPresent</td><td>css=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:css, \"%s\")" % [ value(m[1]) ]
        end
      end

      #
      #
      # <tr><td>verifyElementPresent</td><td>link=JF Feeding</td><td></td></tr>
      #   becomes
      # $browser.find_element(:link_text, "JF Feeding")
      #
      # NOTE: do we need to test for URL instead?
      #     :xpath, ".//a[@href='https://mail.google.com']"
      #
      def replace_verify_element_present_link()
        @line.match %r{.*<td>verifyElementPresent</td><td>link=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:link_text, \"%s\")" % [ value(m[1]) ]
        end
      end

      #
      # <tr><td>verifyElementPresent</td><td>id=showAddFormButton</td><td></td></tr>
      #   becomes
      # $browser.find_element(:id, "showAddFormButton")
      #
      def replace_verify_element_present_id()
        @line.match %r{.*<td>verifyElementPresent</td><td>id=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:id, \"%s\")" % [ value(m[1]) ]
        end
      end

      #
      # <tr><td>verifyTextPresent</td><td>Librarian, Lily Lou</td><td></td></tr>
      #   becomes
      # expect(browser_page_text).to include("Librarian, Lily Lou")
      #
      def replace_verify_text_present()
        @line.match %r{.*<td>verifyTextPresent</td><td>(.+?)</td>.*} do |m|
          @line = "expect(browser_page_text).to include(\"%s\")" % [ value(m[1]) ]
        end
      end

      def value(raw)
        CGI.unescapeHTML(raw.strip).gsub('"', '\"')
      end

      def to_s
        @contents
      end
    end
  end
end

=begin

=end