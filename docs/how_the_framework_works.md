# How the test framework works

## It's RSpec

The test framework is [RSpec][rspec_docs]. 

Tests are run by running `rspec`. 

You may use RSpec command line options when running the tests. A list of options is available 
by typing `rspec --help`.

There are many [tutorials][rspec_tutorial] and [style guides][rspec_style] available for writin gin RSpec

## It's RSpec with additions

The extra goodness is contained in `rubytests/spec/configuration.rb`. Each test must require this file,
usually with a command like this:

```
require_relative '../../configuration'
```

What additions does `configuration.rb` provide?

### Interdependent test steps

RSpec is intended for small, independent test steps (called "examples"). 
In contrast, each vivo acceptance test is a series of related test steps, each one relying on the
successful execution of the previous steps.

`configuration.rb` forces the `--order defined` option, so the test steps are run in the
expected order within each test.

`configuration.rb` contains logic saying that if a test step fails, the remaining steps in that test 
are skipped.

`configuration.rb` also forces the `--format documentation` option, so each test step is listed
in the standard output.

### Global variables

#### `$browser`

An instance of `Selenium::WebDriver::Driver` that represents the Chrome browser in the test. 
Test steps call methods on the driver, like this:

```
$browser.find_element(:link_text, "Index").click
```

#### `$settings`

Contains the settings you provide in environment variables and/or a settings file. 

`$settings` is not referenced in the tests themselves. 
However, it can be useful if you write a `before_starting_server()` method to do
additional VIVO configuration. 

Here is an example of using the `VIVOTEST_OUTPUT_DIRECTORY` setting to add an
RDF file to VIVO.

```
  def before_starting_server
    source = File.expand_path("TestSearchExclusion.n3", File.dirname(__FILE__))
      dest = File.expand_path("home/rdf/display/everytime", $settings.output_path)
      FileUtils.cp(source, dest)
  end

```

#### `$webserver`

This object is essentially a wrapper around the shell scripts that set up the 
execution environment, and start or stop the server.

It is not referenced in the tests themselves.

### Helper methods

`configuration.rb` includes three helper modules, which provide helpful methods
to the tests. [Here is a list][helper_methods] of the methods.

### "Before" and "After" hooks

#### Before the tests begin...

* Clear the output directory. 
* In the output directory, create a `logs` directory and a `failures` directory.

#### Before each test...

* Clear the `logs` directory.
* Assemble a clean VIVO context.
* Assemble a clean home directory
	* This also cleans the triple-stores, the search index, and the uploaded files.
* If the test contains a `before_starting_server()` method, call it.
* Start VIVO.

#### After each test step (a.k.a. "example")...

* If the step failed, capture diagnostic information:
	* The source HTML for the current page.
	* A screenshot of the current page.
	* The logs (__*TO DO*__)
* If the step failed, skip to the end of the test and start the next one.

#### After each test....

* Stop VIVO.
	
## It's VIVO

Look here for more information about [creating the VIVO runtime][vivo_runtime] environment.




[rspec_docs]: http://rspec.info/
[rspec_tutorial]: https://www.tutorialspoint.com/rspec/index.htm
[rspec_style]: http://www.betterspecs.org/
[helper_methods]: ./helper_methods.md
[vivo_runtime]: ./creating_the_VIVO_runtime_environment.md