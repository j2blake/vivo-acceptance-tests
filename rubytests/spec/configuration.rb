require "selenium-webdriver"

RSpec.configure do |config|
  config.order = :defined

  config.before(:all) do
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--window-size=1200x1200')
    $browser = Selenium::WebDriver.for :chrome, options: options
    
    $vivo = VivoHelper.new
  end

  config.after(:all) do
    $browser.quit
  end

  config.after(:each) do |example|
    if example.exception
      $browser.save_screenshot(example.full_description + ".png")
      File.open(example.full_description + ".html", "w") do |f|
        f.puts $browser.page_source
      end
    end
  end
  
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

