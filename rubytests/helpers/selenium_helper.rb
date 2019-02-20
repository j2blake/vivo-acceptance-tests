class SeleniumHelper
  # TODO if logging, write the elapsed time.
  def wait_for_jQuery
    sleep 0.5
    Selenium::WebDriver::Wait.new.until {
      $browser.execute_script("return ($.active == 0)")
    }
  end
end