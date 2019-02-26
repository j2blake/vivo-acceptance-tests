#
# Some convenience methods to make the tests more readable.
#
module SeleniumHelpers
  #
  # Get the page text, so we can test for particular content.
  #
  def browser_page_text
    $browser.find_element(:tag_name, "body").text
  end

  #
  # Selenium can't easily manipulate a <select> list unless it is wrapped.
  #
  def browser_find_select_list(selector, value)
    Selenium::WebDriver::Support::Select.new($browser.find_element(selector, value))
  end

  #
  # A little script to fill in the contents of a WYSIWYG edit box.
  #
  def browser_fill_tinyMCE(text)
    $browser.execute_script("tinyMCE.activeEditor.setContent('#{escape_quotes(text)}')")
  end
  
  def escape_quotes(text)
    text.gsub(/'/, "\'").gsub(/"/, '\"')
  end

  #
  # Wait for the jQuery AJAX calls to complete before proceeding.
  #
  def browser_wait_for_jQuery
    sleep 0.5
    Selenium::WebDriver::Wait.new.until {
      $browser.execute_script("return ($.active == 0)")
    }
  end
end