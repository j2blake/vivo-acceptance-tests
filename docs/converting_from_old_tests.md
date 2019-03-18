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
  
### Not reliable

* Some test steps rely on Javascripts to create the page. For example, those that use TinyMCE. 
	* With no way to tell when the Javascript was complete, `pause` statements were inserted liberally.
* Some test steps rely on the VIVO search indexer to produce the desired results.
	* With no way to tell when the indexing was complete, `pause` statements were inserted liberally.

### Required manual setup

* In some test suites, need to:
	* Run the initial tests.
	* Stop Tomcat, add rdf files, restart Tomcat.
	* Run the remaining tests.

## Conversion process

* Write [this Ruby app][conversion_script] to accomplish most of the conversion.
* Curate the tests by hand to complete the conversion.

## Quirks in the original tests

### Omnipresent calls to `expectTitle`

* The tests were recorded in the Selenium IDE and only minimally modified afterwards.
* The Selenium IDE recorded an `expectTitle` assertion each time a page loaded.
* Frequently, these assertions are repetitive, or irrelevant to the test.

### Ambiguous element selectors

* The Selenium IDE allowed one to specify an element as `"LastName"` for example.
	* Selenium would search for the element as if the specifier were `"id=LastName"` or `"name=LastName"`,
     accepting either result.
   * I don't know which one would override the other.
* In the new tests, the selection method must be explicitly stated as either `:id` or `:name` 
  (or several other possiblilities).

## Instructions for running the original tests

The staff at Cornell maintained a procedural checklist for running the original tests. 
Notations might include:

* Instructions for setting up the test suite.
* Manual operations to be performed between tests in the suite.
* Results to be observed to determine whether the test succeeded.

Here is the most recent checklist available, the 
[checklist for Release 1.8, release candidate 4][selenium_checklist]. 

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
  
### Consider whether "tear-down" steps are useful

The old tests were written to clean up after themselves. Each item that was added for a test was also removed during that test. This attempted to insure that each subsequent test worked against empty content.

With the new test framework, this isn't necessary, since the triple-store is wiped after each test.

So the question resolves to this: does the "tear-down" serve to test functionality? If so, then keep it in. But if not, skip it.



[conversion_script]: ../conversion/scripts/do_conversion.rb
[selenium_checklist]: ./CornellSeleniumTestChecklist_1.8_ReleaseCandidate4.pdf