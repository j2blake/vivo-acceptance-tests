# Things that would be nice

## A setting for the location of the Chrome binary

* Add another setting in settings.rb.
* Make it optional.
* If present, configuration.rb would use it when creating $browser.
* See [Selenium With Headless Chrome on Travis CI](https://www.amihaiemil.com/2017/07/14/selenium-headless-chrome-travis.html)

## Running under Firefox as well as Chrome

* It's not difficult to create the driver:

```
options = Selenium::WebDriver::Firefox::Options.new(args: ['-headless'])
$browser = Selenium::WebDriver.for(:firefox, options: options)
target_size = Selenium::WebDriver::Dimension.new(1200, 1200)
$browser.manage.window.size = target_size    
```

* But why do all of my tests fail?
