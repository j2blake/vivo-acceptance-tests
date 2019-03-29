# Things that would be nice

## Better documentation

* This whole effort is useless unless people continue to write and maintain the tests.
  They need good documents telling how to do so.

## Better diagnostics

* In particular, it would be good to capture the contents of the `output/logs` directory
  for each test that fails. 

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

## Maybe write another shell script to determine when the server is ready

* Currently, `startup.sh` starts the server and `webserver.rb` polls it to find out when
  it is ready to use. What happens when two servers are involved (one for VIVO and one for Solr)?
* In particular, `webserver.rb` runs `startup.sh` asynchronously, and only knows by polling
  when to proceed.

## Create multiple runtime environments

* Hopefully, you could create a different runtime setting just by writting
  another settings file which could point to modified shell scripts, or 
  a directory of modified injection files. This would permit you to run with
  * Firefox or Safari, instead of Chrome
  * Elasticsearch instead of Solr
  * A different triple-store
  * Perhaps even the transient data-stores if they were completed.

It's nice to think that the tests would run in a default environment after each
merge in the repository, but that they could be run in several environments for
testing release candidates.
  
## More flexibility in the Settings

* It would be nice if the `$settings` object would pass all environment variables
  that begin with `VIVOTEST_` to the shell scripts.
* It would be nice if the `$settings` object would pass all settings from the 
  settings file to the shell scripts.
* This would mean that someone could write shell scripts that use an external Solr
  (for example) and just add its settings to the settings file, without having
  to change any Ruby code.

## The transient data stores

* The idea was to use Jena classes to create a memory-only triple-store, and
  to use Lucene classes to create a memory-only search index.
* This would make the tests much, much faster, and require less infrastructure
  for starting and stopping the tests, especially as we transition to an external Solr index.
  
### Why isn't it working?

* VIVO requires that the triple-store uses the union of all named graphs as the
  default graph (unnamed graph). This is available as an option on TDB and on 
  SDB, but the in-memory structures don't do this. (AFAIK)
* Creating the memory-only search index proved more complicated than expected.
	* I didn't attempt to do any scoring, feeling that the tests should not
	  rely on the order of search results.
	* I was able to do keyword-based searches and searches on complete
	  words. I did not get around to implementing prefix and wild-card
	  searches
	* I did not get around to implementing the highlighting logic.

I feel like I could have done this with another week's effort, but I gave
other things higher priority

### It might not be a good idea, anyway

* The only way that this is a good idea is if the transient data stores
  can fully mimic VIVO's standard data stores. If they don't, then at each
  failure you will need to determine whether it's VIVO that's failiing,
  or whether the data store layer isn't working properly.
  
* It would make it more difficult to debug the test. 
	* As things stand, I have a little script (`rubytests/shell_scripts/resume.sh`)
	  which restarts the Jetty server without clearing the data stores. This
	  allows me to see what had been accomplished by the test before it died.
	* If I were using transient data stores, it would be much more difficult
	  to diagnose the problems, because I would need to re-enact the test 
	  from the beginning to find out what the problem is.

## And on, and on, and on...