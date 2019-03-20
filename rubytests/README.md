#Rubytests

## What am I trying to do?

### WATCH OUT!
* Need to install selenium. 
	* `gem install selenium-webdriver`
* Need to install chromedriver.
	* ref: `https://github.com/SeleniumHQ/selenium/wiki/ChromeDriver`
	* On MacOS: `brew tap homebrew/cask && brew cask install chromedriver`

### First steps
* Keep it attainable.
* Need to prepare by:
	* Run mvn package
	* Run scripts/run_tests.sh
* Run it using Ruby
	* First one will just bring up the home page and confirm that it is there.

### Second iteration
* Run it in RSpec

### Third
* Start and stop jetty for each test suite.

### Fourth
* Go back to scripts and re-write run_tests. 
	* Use Maven to make the JARs available.
	* Use Ruby to assemble the app.

## Notes:

### Create the Selenium Chrome driver in Ruby:

* One way:

	```
	caps = Selenium::WebDriver::Remote::Capabilities.chrome("desiredCapabilities" => {"takesScreenshot" => true}, "chromeOptions" => {"binary" => "/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary"})
	
	driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps, switches: %w[--headless --no-sandbox --disable-gpu --remote-debugin-port=9222 --screen-size=1200x800]
	```
	
	* Ref: `https://stackoverflow.com/questions/44424200/how-do-i-use-selenium-webdriver-on-headless-chrome`

* Another way:

	```
	require "selenium-webdriver"
	options = Selenium::WebDriver::Chrome::Options.new
	options.add_argument('--headless')
	driver = Selenium::WebDriver.for :chrome, options: options
	driver.navigate.to "http://localhost:8080/vivo/"
	driver.save_screenshot "vivo-screenshot.png"
	driver.quit
	```	
* Put them together:

	```
	require "selenium-webdriver"
	options = Selenium::WebDriver::Chrome::Options.new
	options.add_argument('--headless')
	options.add_argument('--window-size=1200x1200')
	driver = Selenium::WebDriver.for :chrome, options: options
	driver.navigate.to "http://localhost:8080/vivo/"
	driver.save_screenshot "vivo-screenshot.png"
	driver.quit
	```
	
* Lists of switches and preferences:
	* `https://chromium.googlesource.com/chromium/src/+/master/chrome/common/chrome_switches.cc`
	* `https://chromium.googlesource.com/chromium/src/+/master/chrome/common/pref_names.cc`