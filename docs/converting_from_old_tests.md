# Converting from the old Selenium tests

## Changes to the framework

| | Original tests | Converted tests
| --- | --- | ---|
| Language | Selenese | Ruby
| Framework | Selenium | Selenium 2 / WebDriver |
| Driver | Selenium IDE, under Firefox | RSpec |

## Problems with the original tests

### Non-portable

* When files were to be uploaded, the entire path was hardcoded. So the test file might contain the literal path 
  ``
  
### Race conditions

* Some test steps rely on Javascripts to create the page. For example, those that use TinyMCE. 

* Original tests were run under the Selenium IDE. Used Selenese commands, stored as HTML files. Don't know what version.
* New tests are run under 

## Quirks in the original tests

### `expectTitle`

* The tests were recorded in the Selenium IDE and only minimally modified afterwards.
* The Selenium IDE recorded an `expectTitle` assertion each time a page loaded.
* Frequently, these assertions are repetitive, or irrelevant to the test.

## Things that should be done to clean up the converted tests.

### Improve element locators.

* An element locator like this: 

	```
	:css, "li.nonSelectedGroupTab.clickable"
	``` 

  does not show the user's intent, and also relies on the order of the tabs on the page.
  Change it to this: 
  
  ```
  :xpath, ".//li[@groupname='publications']"
  ```
  
  or even this: 
  
  ```
  :xpath, ".//ul[@class='propertyTabsList']/li[@groupname='publications']"
  ```
  
  to make it clearer and more reliable.
  
* Here's another nice locator:

	  ```
     :xpath, ".//a[text()='Atlantis']/img"
	  ```
	  
### Remove unnecessary calls to `vivo_wait_for_indexing`

Many of these calls were added by the automated conversion process, and are not necessary.
A call to `vivo_wait_for_indexing` is only required when the next operation relies on
the contents of the search index.
  
