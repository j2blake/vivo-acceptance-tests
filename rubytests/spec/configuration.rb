#
# Sets up to run the tests. This must be required from each spec file.
#
require "selenium-webdriver"

require_relative "../helpers/selenium_helpers"
require_relative "../helpers/vivo_helpers"

#
# At startup, fix the configuration the way we like it.
#
RSpec.configure do |config|

  #
  # Make these helper methods available to the tests.
  #
  config.include SeleniumHelpers
  config.include VivoHelpers

  #
  # Always run the tests in the order they are given.
  #
  config.order = :defined

  #
  # Create the Chrome driver as a global variable, and delete it when we are
  # done.
  #
  config.before(:all) do
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--window-size=1200x1200')
    $browser = Selenium::WebDriver.for :chrome, options: options
  end
  config.after(:all) do
    $browser.quit
  end

  #
  # If a test fails, save a screen-shot and the HTML.
  #
  config.after(:each) do |example|
    if example.exception
      $browser.save_screenshot(example.full_description + ".png")
      File.open(example.full_description + ".html", "w") do |f|
        f.puts $browser.page_source
      end
    end
  end

  #
  # If a test fails, don't try to run the remaining tests.
  #
  config.before :all do
    $continue = true
  end
  config.around :each do |example|
    if $continue
      $continue = false
      example.run
      $continue = true unless example.exception
    else
      example.skip
    end
  end

end

