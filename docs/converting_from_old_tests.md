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