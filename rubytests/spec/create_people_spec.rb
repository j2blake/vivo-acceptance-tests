RSpec.configure do |config|
  #  config.before(:each) { expect(1).to equal(2) }
end

describe "Create People" do
  describe "Create Faculty Member" do
    it "logs in" do
      require "selenium-webdriver"
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless')
      options.add_argument('--window-size=1200x1200')
      driver = Selenium::WebDriver.for :chrome, options: options
      driver.navigate.to "http://localhost:8080/vivo/"
      driver.save_screenshot "vivo-screenshot.png"
      driver.quit
      puts "DID IT!!!"
    end
  end
end