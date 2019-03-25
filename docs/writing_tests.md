# Writing VIVO acceptance tests

## An example

Here is a sample test.

```
require_relative '../configuration'

describe "Create People" do
  describe "Create a Faculty Member" do
    it "logs in as Admin" do
      vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")
    end

    it "decides to add a faculty member" do
      $browser.find_element(:link_text, "Site Admin").click
      expect($browser.title).to eq("VIVO Site Administration")

      $browser.find_element(:id, "VClassURI")
      browser_find_select_list(:id, "VClassURI").select_by(:text, "Faculty Member (vivo)")
      $browser.find_element(:id, "submit").click
      expect($browser.title).to eq("Edit")
    end

    it "creates with the basic info" do
      $browser.find_element(:id, "firstName").send_keys("Jane")
      $browser.find_element(:id, "lastName").send_keys("Faculty")
      $browser.find_element(:id, "submit").click
      expect($browser.title).to eq("Faculty, Jane")
    end

    it "adds an overview" do
      $browser.find_element(:class, "add-overview").click
      expect($browser.title).to eq("Edit")

      browser_fill_tinyMCE("Jane is a wonderful professor")
      $browser.find_element(:id, "submit").click
      expect($browser.title).to eq("Faculty, Jane")
      expect(browser_page_text).to include("wonderful professor")
    end

    it "adds a preferred title" do
      $browser.find_element(:css, "#preferredTitle a").click
      expect($browser.title).to eq("Edit")
      expect(browser_page_text).to include("preferred title for")

      $browser.find_element(:id, "preferredTitle").send_keys("Associate Professor")
      $browser.find_element(:id, "submit").click
      expect($browser.title).to eq("Faculty, Jane")
      expect(browser_page_text).to include("Associate Professor")
    end

    it "finds the faculty member on the home page" do
      vivo_wait_for_indexing

      $browser.find_element(:link_text, "Home").click
      expect($browser.title).to eq("VIVO")

      browser_wait_for_jQuery
      $browser.find_element(:link_text, "Faculty, Jane")

      expect($browser.find_element(:id, "research-faculty-mbrs").text).to include("Associate Professor")
    end

    it "logs out" do
      vivo_logout
    end
  end
end
```

## API

Each test must start by configuring the test framework:

```
require_relative '../../configuration'
```

Before writing tests, you should be familiar with [How the test framework works](./how_the_framework_works.md)

The test API includes

* All of [the RSpec core functionality][rspec_core_api] and [the RSpec expectations][rspec_expectations_api]
* [The Selenium/WebDriver gem][selenium_api], accessed by the global variable `$browser`.
* Some [vivo-specific helper methods](./helper_methods.md)

## Pauses in the tests

There are two common ways to wait for VIVO to "catch up with the test".

### Wait for JavaScript

If a button or link causes JavaScript to change the contents of the page,
your test should wait for the JavaScript to finish, with this call:

```
browser_wait_for_jQuery
```

Calls to this method can be inserted freely into the tests, since 
the call will return immediately if no scripts are running.

### Wait for the search indexer

If your test enters data into VIVO, it may need to wait for the search
indexer to process the new data, before continuing with the test.
This call will do that:

```
vivo_wait_for_indexing
```

There is also a convenience method, with this signature:

```
vivo_click_and_wait_for_indexing(how, what)
```

A typical call might look like this:

```
vivo_click_and_wait_for_indexing(:id, "submit")
```

A call to these either of these methods will take at least 2 seconds, and
will often take 5 or 8 seconds. For this reason, it is good to only make
these calls when they are really needed.

Typical reasons to make these calls:

* The test makes assertions about search results.
* The test makes assertions about the home page.
* The test uses the `Index` page for navigation.

There are other reasons.

## `before_starting_server()`

A test may also define a method called `before_starting_server()`. 
This is a hook that runs after the VIVO runtime environment has been set up, but before the
server starts.
It must be defined
at the top level of the test, or it will be ignored.

The most common use of this method is to change the configuration of VIVO for the 
duration of the tests. This method could be used to provide a replacement for `runtime.properties`,
an additional Freemarker template, or some RDF to be loaded at startup.

## Cleaning up afterward?

The old tests are all written to "clean up after themselves". That is, every individual that was
created is deleted. Every attribute that was added is removed.

This was necessary under the old framework because VIVO was not reset after each test.
It is not necessary any more. __*But it might still be desirable.*__

If the clean up tests functionality that is not tested elsewhere, include it. Otherwise,
feel free to omit it.

## Style

### _Don't use the old tests for style guidelines!_

The old tests suffer from a multitude of stylistic sins. It's not their fault.

* The old tests were not written, they were recorded.
* The old tests were written in a language that didn't support subroutines
* The old tests were written in a language that allowed only two levels of organization (tests and suites).
* The old tests were converted to RSpec by an automated converter.
* the old tests may work, but they cannot be called "readable" or "maintainable".

For more on this topic, look at [How to improve the old acceptance tests](./improving_the_old_tests.md)

### Use RSpec for style guidelines -- mostly

The acceptance tests differ from RSpec in that:

* Each test represents a story.
	* The steps in each test must execute in the order they are given.
	* If one step fails in a test, the remaining steps can be expected to fail also.
* Setting up for a test is expensive.
	* Starting VIVO can take up to 3 minutes for each test.
	* Establishing the initial conditions for the test can require many steps.

If these differences are kept in mind, the best practices for RSpec can still
apply in large part to the VIVO acceptance tests.

### Separate the stories -- keep them short

In the old tests, `CreatePeople` is a huge omnibus test. It's unwieldy in several ways.

* A failure doesn't provide much information.
	* If this were several small tests, we might be able to diagnose a problem
	  by looking at which tests failed. With only one test, we get only one failure.
* Fixing them takes forever.
	* If it takes 10 minutes to reach the step that fails, and then 11 minutes
	  to reach the next failure, etc., the result is a very long process.
	  
### Shared examples

The automated conversion routines used `include_examples` / `shared_examples`
mechanism to preserve a one to one relationship between the files of the old
tests and the files of the new tests.

It's probably better to use `shared_examples` only where they are actually 
shared between tests.



[selenium_api]: https://seleniumhq.github.io/selenium/docs/api/rb/Selenium/WebDriver
[rspec_core_api]: https://www.rubypigeon.com/posts/rspec-core-cheat-sheet/
[rspec_expectations_api]: https://www.rubypigeon.com/posts/rspec-expectations-cheat-sheet/