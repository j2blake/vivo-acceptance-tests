#
# Some convenience methods to make the tests more readable.
#
module SeleniumHelpers
  #
  # Get the page text, so we can test for particular content.
  #
  def page_text
    $browser.find_element(:tag_name, "body").text
  end

  #
  # Selenium can't easily manipulate a <select> list unless it is wrapped.
  #
  def find_select_list(selector, value)
    Selenium::WebDriver::Support::Select.new($browser.find_element(selector, value))
  end
  
  #
  # Wait for the jQuery AJAX calls to complete before proceeding.
  #
  def wait_for_jQuery
    sleep 0.5
    Selenium::WebDriver::Wait.new.until {
      $browser.execute_script("return ($.active == 0)")
    }
  end
end