require("cgi")

module Converter
  module Testfile
    class CommonTagReplacer
      def initialize(contents)
        @contents = contents.each_line.reduce("") do |buffer, line|
          @line = line.chomp

          @replace =
          replace_assert_confirmation ||
          replace_assert_text_present ||
          replace_assert_title ||
          replace_click ||
          replace_click_and_wait ||
          replace_open ||
          replace_select ||
          replace_tinymce ||
          replace_type ||
          replace_verify_element_not_present ||
          replace_verify_element_present ||
          replace_verify_text ||
          replace_verify_text_not_present ||
          replace_verify_text_present ||
          replace_verify_value

          if @replace
            buffer += @replace + "    " + @line + "\n"
          else
            buffer += @line + "\n"
          end

          #    #<tr><td>sendKeys</td><td>id=object</td><td>Afri</td></tr>
          # something like:     $browser.find_element(id: "object").send_keys("Afri")
          #
          #     #<tr><td>sendKeys</td><td>id=object</td><td>${KEY_DOWN}</td></tr>
          # something like:     $browser.find_element(id: "object").send_keys(Selenium::WebDriver::Keys.down)
          #
        end
      end

      #
      # #<tr><td>assertConfirmation</td><td>Are you SURE you want to delete this individual?</td><td></td></tr>
      #   becomes
      # expect($browser.switchTo.alert.text).to eq("Are you SURE you want to delete this individual?")
      #
      def replace_assert_confirmation()
        @line.match %r{<td>assertConfirmation</td><td>(.+?)</td>} do |m|
          interpret("expect($browser.switchTo.alert.text).to eq(\"%s\")", value(m[1]))
        end
      end

      #
      # <tr><td>assertTextPresent</td><td>Librarian, Lily Lou</td><td></td></tr>
      #   becomes
      # expect(browser_page_text).to include("Librarian, Lily Lou")
      #
      def replace_assert_text_present()
        @line.match %r{<td>assertTextPresent</td><td>(.+?)</td>} do |m|
          interpret("expect(browser_page_text).to include(\"%s\")", value(m[1]))
        end
      end

      #
      # <tr><td>assertTitle</td><td>Faculty, Jane</td><td></td></tr>
      #   becomes
      # expect($browser.title).to eq("Faculty, Jane")
      #
      def replace_assert_title()
        @line.match %r{<td>assertTitle</td><td>(.+?)</td>} do |m|
          interpret("expect($browser.title).to eq(\"%s\")", value(m[1]))
        end
      end

      #
      # <tr><td>click</td><td>css=li.nonSelectedGroupTab.clickable</td><td></td></tr>
      #   becomes
      # $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
      #
      def replace_click()
        @line.match %r{<td>click</td><td>(.+?)</td>} do |m|
          interpret("$browser.find_element(\"%s\").click", element_spec(m[1]))
        end
      end

      #
      # <tr><td>clickAndWait</td><td>link=Index</td><td></td></tr>
      #   becomes
      # $browser.find_element(:link_text, "Index").click
      #
      def replace_click_and_wait()
        @line.match %r{<td>clickAndWait</td><td>(.+?)</td>} do |m|
          interpret("$browser.find_element(\"%s\").click", element_spec(m[1]))
        end
      end

      #
      # #<tr><td>open</td><td>/vivo/</td><td></td></tr>
      #   becomes
      # $browser.navigate.to vivo_url("/")
      #
      def replace_open()
        @line.match %r{<td>open</td><td>/vivo(.+?)</td>} do |m|
          interpret("$browser.navigate.to vivo_url(\"%s\")", value(m[1]))
        end
      end

      #
      # <tr><td>select</td><td>typeSelector</td><td>label=Academic Article</td></tr>
      #   becomes
      # browser_find_select_list(:name, "typeSelector").select_by(:text, "Academic Article")
      #
      def replace_select()
        @line.match %r{<td>select</td><td>(.+?)</td><td>label=(.+?)</td>} do |m|
          interpret("browser_find_select_list(\"%s\").select_by(:text, \"%s\"))", element_spec(m[1]), value(m[2]))
        end
      end

      #
      # <tr><td>runScript</td><td>tinyMCE.activeEditor.setContent('I study monkeys.')</td><td></td></tr>
      #   becomes
      # browser_fill_tinyMCE('I study monkeys')
      #
      def replace_tinymce()
        @line.match %r{<td>tinyMCE.activeEditor.setContent\((.*)\)</td>} do |m|
          interpret("browser_fill_tinyMCE(%s)", value(m[1]))
        end
      end

      #
      #<tr><td>type</td><td>loginName</td><td>testAdmin@cornell.edu</td></tr>
      #   becomes
      # $browser.find_element(:name, "loginName").send_keys("testAdmin@cornell.edu")
      #
      def replace_type()
        @line.match %r{td>type</td><td>(.+?)</td><td>(.*?)</td>} do |m|
          interpret("$browser.find_element(\"%s\").send_keys(\"%s\")", element_spec(m[1]), value(m[2]))
        end
      end

      #
      # <tr><td>verifyElementNotPresent</td><td>link=Faculty, Jane</td><td></td></tr>
      #   becomes
      # expect($browser.find_elements(:link_name, "Faculty, Jane")).size.to eq(0)
      #
      def replace_verify_element_not_present()
        @line.match %r{<td>verifyElementNotPresent</td><td>(.+?)</td>} do |m|
          interpret("expect($browser.find_elements(\"%s\")).size.to eq(0)", element_spec(m[1]))
        end
      end

      #
      # <tr><td>verifyElementPresent</td><td>css=a[title=&quot;name&quot;]</td><td></td></tr>
      #   becomes
      # $browser.find_element(:css, "a[title=\"name\"]")
      #
      def replace_verify_element_present()
        @line.match %r{<td>verifyElementPresent</td><td>(.+?)</td>} do |m|
          interpret("$browser.find_element(\"%s\")", element_spec(m[1]))
        end
      end

      #
      # <tr><td>verifyText</td><td>css=h2.searchResultsHeader</td><td>Search results for 'lecturer'</td></tr>
      #   becomes
      # expect($browser.find_element(:css, 'h2.searchResultsHeader').text).to eq("Search results for 'lecturer'")
      #
      def replace_verify_text()
        @line.match %r{td>verifyText</td><td>(.+?)</td><td>(.+?)</td>} do |m|
          interpret("expect($browser.find_element(%s).text).to eq(\"%s\")", element_spec(m[1]), value(m[2]))
        end
      end

      #
      # <tr><td>verifyTextNotPresent</td><td>Librarian, Lily Lou</td><td></td></tr>
      #   becomes
      # expect(browser_page_text).not_to include("Librarian, Lily Lou")
      #
      def replace_verify_text_not_present()
        @line.match %r{<td>verifyTextNotPresent</td><td>(.+?)</td>} do |m|
          interpret("expect(browser_page_text).not_to include(\"%s\")", value(m[1]))
        end
      end

      #
      # <tr><td>verifyTextPresent</td><td>Librarian, Lily Lou</td><td></td></tr>
      #   becomes
      # expect(browser_page_text).to include("Librarian, Lily Lou")
      #
      def replace_verify_text_present()
        @line.match %r{<td>verifyTextPresent</td><td>(.+?)</td>} do |m|
          interpret("expect(browser_page_text).to include(\"%s\")", value(m[1]))
        end
      end

      #
      # <tr><td>verifyValue</td><td>id=offerCreate</td><td>Add a new item of this type</td></tr>
      #   becomes
      # expect($browser.find_element(:id, "offerCreate")["value"]).to eq("Add a new item of this type")
      #
      def replace_verify_value()
        @line.match %r{td>verifyValue</td><td>(.+?)</td><td>(.+?)</td>} do |m|
          interpret("expect($browser.find_element(%s)[\"value\"]).to eq(\"%s\")", element_spec(m[1]), value(m[2]))
        end
      end

      #
      # Make the replacement and return the string, providing that none of the
      # values are nil.
      #
      def interpret(template, *values)
        if values.all? { |v| v }
          template % values
        else
          nil
        end
      end

      #
      # Do we recognize this as a valid element specifier in Selenium-HTML?
      # Reformat it for Selenium-Ruby, or return nil.
      #
      def element_spec(raw)
        raw.match %r{^css=(.+)} do |m|
          return ":css, \"%s\"" % value(m[1])
        end
        raw.match %r{^id=(.+)} do |m|
          return ":id, \"%s\"" % value(m[1])
        end
        raw.match %r{^link=(.+)} do |m|
          return ":link_text, \"%s\"" % value(m[1])
        end
        raw.match %r{^name=(.+)} do |m|
          return ":name, \"%s\"" % value(m[1])
        end
        raw.match %r{^xpath=(.+)} do |m|
          return ":xpath, \"%s\"" % adjust_xpath(value(m[1]))
        end
        raw.match %r{^(//.+)} do |m| # implicit XPath
          return ":xpath, \"%s\"" % adjust_xpath(value(m[1]))
        end
        raw.match %r{^(.+)} do |m| # implicit name
          return ":name, \"%s\"" % adjust_xpath(value(m[1]))
        end
        nil
      end

      #
      # Selenium-HTML allowed xpath's to start with "//" to specify "anywhere in
      # the document". Selenium-Ruby requires ".//"
      #
      def adjust_xpath(raw)
        raw.gsub(%r{//}, './/')
      end

      #
      # Some values were HTML-encoded, in order to be specified in the HTML-based
      # tests. Now, they should be Ruby-string-encoded instead.
      #
      # These values include text to be typed, CSS specifiers, XPath
      # specifiers, and maybe more.
      #
      def value(raw)
        CGI.unescapeHTML(raw.strip).gsub('"', '\"')
      end

      def to_s
        @contents
      end
    end
  end
end
