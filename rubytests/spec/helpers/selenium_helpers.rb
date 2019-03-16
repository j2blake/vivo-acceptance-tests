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
    # Create for later - a wait with a 60-second timeout
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)

    # get into the IFrame
    iframe = wait.until{$browser.find_element(:id => 'literal_ifr')}
    $browser.switch_to.frame(iframe)
    body_element = wait.until{$browser.find_element(:tag_name => 'body')}

    # Clear the contents and enter the new text
    body_element.clear
    body_element.send_keys(text)

    # Go back
    $browser.switch_to.parent_frame
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
    sleep 0.5
  end
  
  #
  # Check that the alert box exists, and has the expected text. Accept it.
  #
  # Clean the white space in both the expected text and the actual text.
  # New-lines or multiple spaces are difficult to match.
  #
  def browser_accept_alert(expected_text)
    expected_clean_text = expected_text.gsub(/\s+/, ' ')
    actual_text = $browser.switch_to.alert.text
    actual_clean_text = actual_text.gsub(/\s+/, ' ')
    expect(actual_clean_text).to eq(expected_clean_text)
    $browser.switch_to.alert.accept
    browser_wait_for_jQuery
  end
end