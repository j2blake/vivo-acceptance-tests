#
# Sets up to run the tests. This must be required from each spec file.
#
require "selenium-webdriver"

require_relative "helpers/selenium_helpers"
require_relative "helpers/settings"
require_relative "helpers/tester_helpers"
require_relative "helpers/webserver"
require_relative "helpers/vivo_helpers"

#
# At startup, fix the configuration the way we like it.
#
RSpec.configure do |config|

  #
  # Make these helper methods available to the examples.
  #
  config.include SeleniumHelpers
  config.include TesterHelpers
  config.include VivoHelpers

  #
  # Always run the tests and examples in the order they are given.
  #
  config.order = :defined
  
  #
  # Print the name of each example as it executes.
  #
  config.formatter = :documentation

  #
  # Load the settings and create a clean environment for the tests to run in.
  #
  config.before(:suite) do
    $settings = Settings.new
    $webserver = Webserver.new
    $webserver.setup_session
  end

  #
  # For each test, Start the webserver and create the Chrome driver.
  #
  config.before(:all) do |context|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--window-size=1200x1200')
    $browser = Selenium::WebDriver.for :chrome, options: options

    if $webserver.running?
      puts
      puts "The webserver wasn't shut down properly."
      puts
      exit(false)
    end
    
    $webserver.setup_test
    
    # Any last-minute instructions?
    context.before_starting_server if context.respond_to?("before_starting_server")
    
    $webserver.start
  end
  
  #
  # Success or failure, close the browser and stop the webserver at the end of 
  # each test.
  #
  config.after(:all) do
    $webserver.stop
    $browser.quit
    $browser = nil
  end

  #
  # If an example fails, save a screen-shot and the HTML.
  #
  config.after(:each) do |example|
    if example.exception
      $browser.save_screenshot($settings.failure_path + "/" + example.full_description + ".png")
      File.open($settings.failure_path + "/" + example.full_description + ".html", "w") do |f|
        f.puts $browser.page_source
      end
    end
  end

  #
  # If an example fails, don't try to run the remainder of the test.
  #
  config.before(:all) do
    $continue = true
  end
  
  config.around(:each) do |example|
    if $continue
      $continue = false
      example.run
      $continue = true unless example.exception
    else
      example.skip
    end
  end

end

