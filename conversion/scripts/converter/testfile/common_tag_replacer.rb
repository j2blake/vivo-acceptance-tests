require("cgi")

module Converter
  module Testfile
    class CommonTagReplacer
      def initialize(contents)
        @contents = contents.each_line.reduce("") do |buffer, line|
          @line = line.chomp
          replace_assert_title()
          replace_click_id
          replace_click_xpath
          replace_click_and_wait_css
          replace_click_and_wait_id
          replace_click_and_wait_link
          replace_click_and_wait_xpath
          replace_select_id
          replace_select_name
          replace_tinymce
          replace_type()
          replace_verify_element_present_link()
          replace_verify_element_present_id()
          replace_verify_text_present()
          buffer += @line + "\n"
          #     #<tr><td>clickAndWait</td><td>submit</td><td></td></tr>
          # "submit" is id
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
          # replace_click_css
          # pause
          #
          #     #<tr><td>clickAndWait</td><td>xpath=(//img[@alt='add'])[29]</td><td></td></tr>
          # Is this another valid syntax?
          #
        end
      end

      #
      # <tr><td>assertTitle</td><td>Faculty, Jane</td><td></td></tr>
      #   becomes
      # expect($browser.title).to eq("Faculty, Jane")
      #
      def replace_assert_title()
        @line.match %r{.*<td>assertTitle</td><td>(.+?)</td>.*} do |m|
          @line = "expect($browser.title).to eq(\"%s\")" % [ m[1].strip ]
        end
      end

      #
      # <tr><td>click</td><td>id=showAddFormButton</td><td></td></tr>
      #   becomes
      # $browser.find_element(:id, "showAddFormButton").click
      #
      def replace_click_id()
        @line.match %r{.*<td>click</td><td>id=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:id, \"%s\").click" % [ m[1].strip ]
        end
      end

      #
      # <tr><td>click</td><td>//div[@id='wrapper-content']/ul/li[18]</td><td></td></tr>
      #   becomes
      # $browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[18]").click
      #
      def replace_click_xpath()
        @line.match %r{.*<td>click</td><td>//(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:xpath, \".//%s\").click" % [ m[1].strip ]
        end
      end

      #
      # <tr><td>clickAndWait</td><td>css=a.add-assigneeFor &gt; img.add-individual</td><td></td></tr>
      #   becomes
      # $browser.find_element(:css, "a.add-assigneeFor > img.add-individual").click
      #
      def replace_click_and_wait_css()
        @line.match %r{.*<td>clickAndWait</td><td>css=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:css, \"%s\").click" % [ CGI.unescapeHTML(m[1].strip) ]
        end
      end

      #
      # <tr><td>clickAndWait</td><td>id=submit</td><td></td></tr>
      #   becomes
      # $browser.find_element(:id, "submit").click
      #
      def replace_click_and_wait_id()
        @line.match %r{.*<td>clickAndWait</td><td>id=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:id, \"%s\").click" % [ m[1].strip ]
        end
      end

      #
      # <tr><td>clickAndWait</td><td>link=Index</td><td></td></tr>
      #   becomes
      # $browser.find_element(:link_text, "Index").click
      #
      def replace_click_and_wait_link()
        @line.match %r{.*<td>clickAndWait</td><td>link=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:link_text, \"%s\").click" % [ m[1].strip ]
        end
      end

      #
      # <tr><td>clickAndWait</td><td>//h2[@id='hasResearchArea']/a/img</td><td></td></tr>
      #   becomes
      # $browser.find_element(:xpath, "//h2[@id='hasResearchArea']/a/img").click
      #
      def replace_click_and_wait_xpath()
        @line.match %r{.*<td>clickAndWait</td><td>//(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:xpath, \".//%s\").click" % [ m[1].strip ]
        end
      end

      #
      # <tr><td>select</td><td>id=typeSelector</td><td>label=License</td></tr>
      #   becomes
      # find_select_list(:id, "typeSelector").select_by(:text, "License")
      #
      def replace_select_id()
        @line.match %r{.*<td>select</td><td>id=(.+?)</td><td>label=(.+?)</td>.*} do |m|
          @line = "find_select_list(:id, \"%s\").select_by(:text, \"%s\"))" % [ m[1].strip, m[2].strip ]
        end
      end

      #
      # <tr><td>select</td><td>name=urlType</td><td>label=Standard Web Link</td></tr>
      #   becomes
      # find_select_list(:name, "urlType").select_by(:text, "Standard Web Link")
      #
      def replace_select_name()
        @line.match %r{.*<td>select</td><td>name=(.+?)</td><td>label=(.+?)</td>.*} do |m|
          @line = "find_select_list(:name, \"%s\").select_by(:text, \"%s\"))" % [ m[1].strip, m[2].strip ]
        end
      end

      #
      # <tr><td>runScript</td><td>tinyMCE.activeEditor.setContent('I study monkeys.')</td><td></td></tr>
      #   becomes
      # browser_fill_tinyMCE('I study monkeys')
      #
      def replace_tinymce()
        @line.match %r{.*<td>tinyMCE.activeEditor.setContent\((.*)\)</td>.*} do |m|
          @line = "browser_fill_tinyMCE(%s)" % [ m[1].strip ]
        end
      end

      #
      # <tr><td>type</td><td>id=advisor</td><td>Adams</td></tr>
      #   becomes
      # $browser.find_element(:id, "preferredTitle").send_keys("Adams")
      #
      def replace_type()
        @line.match %r{.*<td>type</td><td>id=(.+?)</td><td>(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:id, \"%s\").send_keys(\"%s\")" % [ m[1].strip, m[2].strip ]
        end
      end

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
          @line = "$browser.find_element(:link_text, \"%s\")" % [ m[1].strip ]
        end
      end

      #
      # <tr><td>verifyElementPresent</td><td>id=showAddFormButton</td><td></td></tr>
      #   becomes
      # $browser.find_element(:id, "showAddFormButton")
      #
      def replace_verify_element_present_id()
        @line.match %r{.*<td>verifyElementPresent</td><td>id=(.+?)</td>.*} do |m|
          @line = "$browser.find_element(:id, \"%s\")" % [ m[1].strip ]
        end
      end

      #
      # <tr><td>verifyTextPresent</td><td>Librarian, Lily Lou</td><td></td></tr>
      #   becomes
      # expect(page_text).to include("Librarian, Lily Lou")
      #
      def replace_verify_text_present()
        @line.match %r{.*<td>verifyTextPresent</td><td>(.+?)</td>.*} do |m|
          @line = "expect(page_text).to include(\"%s\")" % [ m[1].strip ]
        end
      end

      def to_s
        @contents
      end
    end
  end
end

=begin

=end