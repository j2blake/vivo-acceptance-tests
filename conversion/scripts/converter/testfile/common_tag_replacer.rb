require("cgi")

require_relative 'parsing_utils'

module Converter
  module Testfile
    class CommonTagReplacer
      include ParsingUtils
      #
      def initialize(parsed)
        @parsed = parsed
      end

      def go
        @result = []

        @parsed.each do |line|
          @line = line

          replacement =
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

          @result.concat([ *(replacement || @line) ])
        end

        @result

        #    #<tr><td>sendKeys</td><td>id=object</td><td>Afri</td></tr>
        # something like:     $browser.find_element(id: "object").send_keys("Afri")
        #
        #     #<tr><td>sendKeys</td><td>id=object</td><td>${KEY_DOWN}</td></tr>
        # something like:     $browser.find_element(id: "object").send_keys(Selenium::WebDriver::Keys.down)
        #

      end

      #
      # #<tr><td>assertConfirmation</td><td>Are you SURE you want to delete this individual?</td><td></td></tr>
      #   becomes
      # expect($browser.switchTo.alert.text).to eq("Are you SURE you want to delete this individual?")
      #
      def replace_assert_confirmation()
        @line.match(/^assertConfirmation$/) do
          interpret("expect($browser.switchTo.alert.text).to eq(\"%s\")", value(@line.field2))
        end
      end

      #
      # <tr><td>assertTextPresent</td><td>Librarian, Lily Lou</td><td></td></tr>
      #   becomes
      # expect(browser_page_text).to include("Librarian, Lily Lou")
      #
      def replace_assert_text_present()
        @line.match(/^assertTextPresent$/) do
          interpret("expect(browser_page_text).to include(\"%s\")", value(@line.field2))
        end
      end

      #
      # <tr><td>assertTitle</td><td>Faculty, Jane</td><td></td></tr>
      #   becomes
      # expect($browser.title).to eq("Faculty, Jane")
      #
      # For search results, change the expected title.
      #
      def replace_assert_title()
        @line.match("assertTitle") do |m|
          title = adjust_title(m[1][0])
          interpret("expect($browser.title).to eq(\"%s\")", value(title))
        end
      end

      def adjust_title(text)
        text.gsub(/^(.*) - VIVO Search Results$/, "Search for '\\1'")
      end

      #
      # <tr><td>click</td><td>css=li.nonSelectedGroupTab.clickable</td><td></td></tr>
      #   becomes
      # $browser.find_element(:css, "li.nonSelectedGroupTab.clickable").click
      #
      def replace_click()
        @line.match(/^click$/) do
          interpret("$browser.find_element(%s).click", element_spec(@line.field2))
        end
      end

      #
      # <tr><td>clickAndWait</td><td>link=Index</td><td></td></tr>
      #   becomes
      # $browser.find_element(:link_text, "Index").click
      #
      def replace_click_and_wait()
        @line.match(/^clickAndWait$/) do
          interpret("$browser.find_element(%s).click", element_spec(@line.field2))
        end
      end

      #
      # #<tr><td>open</td><td>/vivo/</td><td></td></tr>
      #   becomes
      # $browser.navigate.to vivo_url("/")
      #
      def replace_open()
        @line.match(/^open$/, %r{^/vivo.*}) do
          interpret("$browser.navigate.to vivo_url(\"%s\")", value(@line.field2[5..-1]))
        end
      end

      #
      # <tr><td>select</td><td>typeSelector</td><td>label=Academic Article</td></tr>
      #   becomes
      # browser_find_select_list(:name, "typeSelector").select_by(:text, "Academic Article")
      #
      def replace_select()
        @line.match(/^select$/, /.*/, /^label=/) do
          interpret("browser_find_select_list(%s).select_by(:text, \"%s\")", element_spec(@line.field2), value(@line.field3[6..-1]))
        end
      end

      #
      # <tr><td>runScript</td><td>tinyMCE.activeEditor.setContent('I study monkeys.')</td><td></td></tr>
      #   becomes
      # browser_fill_tinyMCE("I study monkeys")
      #
      def replace_tinymce()
        @line.match(/^runScript$/, /^tinyMCE.activeEditor.setContent\(['"](.*)['"]\)$/) do |m|
          interpret("browser_fill_tinyMCE(\"%s\")", value(m[1][1]))
        end
      end

      #
      # Special case for typing file paths:
      # <tr><td>type</td><td>name=rdfStream</td><td>C:\VIVO\vivo\utilities\acceptance-tests\suites\LanguageSupport\Test-utf8</td></tr>
      #   becomes
      # $browser.find_element(:name, "rdfStream").send_keys(tester_filepath("Test-utf8"))
      #
      # Else:
      # <tr><td>type</td><td>loginName</td><td>testAdmin@cornell.edu</td></tr>
      #   becomes
      # $browser.find_element(:name, "loginName").send_keys("testAdmin@cornell.edu")
      #
      def replace_type()
        response = @line.match(/^type$/, /.*/, /^C:(.*)$/) do |m|
          interpret("$browser.find_element(%s).send_keys(tester_filepath(\"%s\", __FILE__))", element_spec(m[1][0]), strip_file_path(m[2][1]))
        end
        unless response
          response = @line.match(/^type$/) do |m|
            interpret("$browser.find_element(%s).send_keys(\"%s\")", element_spec(m[1][0]), value(m[2][0]))
          end
        end
        response
      end

      #
      # <tr><td>verifyElementNotPresent</td><td>link=Faculty, Jane</td><td></td></tr>
      #   becomes
      # expect($browser.find_elements(:link_name, "Faculty, Jane")).size.to eq(0)
      #
      def replace_verify_element_not_present()
        @line.match(/^verifyElementNotPresent$/) do |m|
          interpret("expect($browser.find_elements(%s)).size.to eq(0)", element_spec(m[1][0]))
        end
      end

      #
      # <tr><td>verifyElementPresent</td><td>css=a[title=&quot;name&quot;]</td><td></td></tr>
      #   becomes
      # $browser.find_element(:css, "a[title=\"name\"]")
      #
      def replace_verify_element_present()
        @line.match(/^verifyElementPresent$/) do |m|
          interpret("$browser.find_element(%s)", element_spec(m[1][0]))
        end
      end

      #
      # <tr><td>verifyText</td><td>css=h2.searchResultsHeader</td><td>Search results for 'lecturer'</td></tr>
      #   becomes
      # expect($browser.find_element(:css, 'h2.searchResultsHeader').text).to eq("Search results for 'lecturer'")
      #
      def replace_verify_text()
        @line.match(/^verifyText$/) do |m|
          interpret("expect($browser.find_element(%s).text).to eq(\"%s\")", element_spec(m[1][0]), value(m[2][0]))
        end
      end

      #
      # <tr><td>verifyTextNotPresent</td><td>Librarian, Lily Lou</td><td></td></tr>
      #   becomes
      # expect(browser_page_text).not_to include("Librarian, Lily Lou")
      #
      def replace_verify_text_not_present()
        @line.match(/^verifyTextNotPresent$/) do |m|
          interpret("expect(browser_page_text).not_to include(\"%s\")", value(m[1][0]))
        end
      end

      #
      # <tr><td>verifyTextPresent</td><td>Librarian, Lily Lou</td><td></td></tr>
      #   becomes
      # expect(browser_page_text).to include("Librarian, Lily Lou")
      #
      def replace_verify_text_present()
        @line.match(/^verifyTextPresent$/) do |m|
          interpret("expect(browser_page_text).to include(\"%s\")", value(m[1][0]))
        end
      end

      #
      # <tr><td>verifyValue</td><td>id=offerCreate</td><td>Add a new item of this type</td></tr>
      #   becomes
      # expect($browser.find_element(:id, "offerCreate")["value"]).to eq("Add a new item of this type")
      #
      def replace_verify_value()
        @line.match(/^verifyValue$/) do |m|
          interpret("expect($browser.find_element(%s)[\"value\"]).to eq(\"%s\")", element_spec(m[1][0]), value(m[2][0]))
        end
      end

      #
      # Make the replacement and return the string, providing that none of the
      # values are nil.
      #
      def interpret(template, *values)
        if values.all? { |v| v }
          Line.new((template % values) + "    " + @line.text)
        else
          nil
        end
      end

    end
  end
end