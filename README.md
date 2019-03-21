# vivo-acceptance-tests

A collection of end-to-end tests for the VIVO application; written in Ruby, running under RSpec, supported by Selenium/WebDriver, driving a headless Chrome browser, with VIVO deployed in an instance of JettyRunner.

## How the tests operate

This is what happens:

* You set environment variables, specifying:
	* The location of the VIVO application being tested.
	* An output directory for the tests.

* You tell the test framework to run a group of tests.

* The test framework clears the output directory.

* For each test, the framework 
	* Assembles a clean execution context for VIVO
	* Starts the VIVO application
	* Issues commands to the Chrome browser, interacting with VIVO
	* Verifies the results in the browser.
	* Stops the VIVO application.

* The framework captures diagnostic information for each test that fails, including:
	* A screen shot of the browser page at the time of the failure.
	* A copy of the HTML in the browser at the time of the failure.
	* Copies of the log files at the time of the failure (__*TO DO*__)

* The framework exits with a code of 0 if all tests were successful, or 1 if any tests failed.


## Installation

Your system must include these components, in order to run the tests.

### Ruby

Your system must include a Ruby language environment. This project was developed using Ruby 2.5.

[Installing Ruby][installing_ruby].

### Rspec

Your Ruby environment must include the RSpec gem. This project was developed using RSpec 3.8.

You should be able to install RSpec by typing `gem install rspec`.

### Chrome

Your system must include the Chrome browser. This project was developed using Google Chrome Version 72 (64-bit).

[Installing the Chrome browser][installing_chrome].

### ChromeDriver

__*Andrew: I'm not sure what needs to happen here. If I recall correctly, if you try running the test
framework without this, you will see a message telling you to install ChromeDriver, with a link to some 
installation instructions. I won't know until I can test these instructions on a clean machine.*__

[Documentation for ChromeDriver][chromedriver_docs].

### VIVO

These instructions are based on [the standard VIVO installation instructions][vivo_installation]. 
They are simpler, because the test harness makes many of the steps unnecessary.

#### Download the repositories

* Create an empty directory to use for the installation.

* In that directory, download the VIVO and Vitro repositories. To test the develop branch, 
  use these commands:

	```
	$ git clone https://github.com/vivo-project/Vitro.git
	$ git clone https://github.com/vivo-project/VIVO.git
	```
	
	To test release 1.10, use these commands instead:
	
	```
	$ git clone https://github.com/vivo-project/Vitro.git Vitro -b rel-1.10-maint
	$ git clone https://github.com/vivo-project/VIVO.git VIVO -b rel-1.10-maint
	```

#### Create a settings file

Make a copy of the `installer/example-settings.xml` file in your VIVO workspace,
(just created by the `git clone` command)
and edit the settings. For the test framework, these settings should be:

* `app-name` -- Must be set to `vivo`
* `vivo-dir` -- Not important. The test framework will create its own home directory.
* `tomcat-dir` -- Not important. the test framework will not use Tomcat.

_Even though they aren't used, you should set `vivo-dir` and `tomcat-dir` to reasonable directory
paths. They will not be used by the `mvn package` command (see below), but what if you 
type `mvn install` through force of habit?_

#### Run a partial installation

From within your `VIVO` workspace, issue the maven "package" command:

```
mvn package -s [your settings file]
```	

For example:

```
mvn package -s ../install_settings.xml
```

## Running the tests

### The direct way

* Go to the `rubytests` folder of this project workspace.
* Set environment variables that specify the location of the VIVO workspace (created by `git clone`),
  and the location of your output directory. 
	* The output directory must already exist, and __it will be emptied at the beginning of each run__.
	* Relative paths in the environment variables, if used, will be relative to your current working 
	  directory when you run the tests.
* Issue the `rspec` command. 
	* `rspec` will run all of the tests.
	* `rspec spec/curated_tests/` will run only the tests in that folder.
	* `rspec spec/converted/CreatePeople/Create_People_spec.rb` will run only that test.

In the `rubytests` directory, issue commands like this:

```
export VIVOTEST_OUTPUT_DIRECTORY=[your output directory]
export VIVOTEST_VIVO_PROJECT=[your VIVO distribution workspace]
rspec spec/curated_tests
```

For example:

```
export VIVOTEST_OUTPUT_DIRECTORY=/Users/jeb228/Development/VIVO/AcceptanceTests/output/
export VIVOTEST_VIVO_PROJECT=/Users/jeb228/Development/VIVO/Projects/VIVO/
rspec spec/curated_tests
```

### The indirect way

* Create a settings file for the tests.
	* In the settings file, specify the VIVO workspace and the output directory.
	* Relative paths in the settings file will be relative to the file itself.
* Go to the `rubytests` folder of this project workspace.
* Point to the settings file while issueing the `rspec` command

You could create a file `~/example_settings` something like this:

```
# Settings for a typical run
VIVOTEST_OUTPUT_DIRECTORY=[your output directory]
VIVOTEST_VIVO_PROJECT=[your VIVO distribution workspace]
```

For example:

```
# Settings for a typical run
VIVOTEST_OUTPUT_DIRECTORY=Development/VIVO/AcceptanceTests/output/
VIVOTEST_VIVO_PROJECT=Development/VIVO/Projects/VIVO/
```
Note again that the paths in the settings file can be relative paths,
in which case they are relative to the settings file itself.

Then you could use these commands:

```
export VIVOTEST_SETTINGS=~/example_settings 
rspec spec/curated_tests
``` 

Or this command:

```
VIVOTEST_SETTINGS=~/example_settings rspec spec/curated_tests
``` 

Either of these would have the same effect as the direct way.

## The structure of this project

This project consists of these top-level folders:

* `conversion` -- The original VIVO Selenium tests, and some programs used to convert
  them to the new framework. 
	* Some of the original tests have been modified by hand, to make the conversion easier.
* `docs` -- More notes about how this project was developed, and how it works.
* `rubytests` -- The new test framework and the new tests. Within this, we have
	* `spec/artisanal_tests` -- Some simple tests that were created as "proof of concept",
	  and perhaps as illustrations of best practices. Not useful otherwise.
	* `spec/converted` -- Tests that were converted from the original form. For one reason
	  or another, these do not pass. As they are fixed, they should be moved to `spec\curated_tests`.
	* `spec/curated_tests` -- Tests that were converted from the original form and then 
	  modified as needed. These should all pass.
* `transience` -- Some experiments at creating "stub" versions of the Solr index and the 
  triple stores. 
	* These are intended to be plug-compatible with the components used by VIVO, 
     but to store their data only in memory. Hence, "transient".
   * If these were successful, we would expect that the tests would run much more quickly.
     So far, however, these experiments have not brought success.

## More information

* The [`/docs`](./docs) directory of this project.
* [RSpec: Behaviour Driven Development for Ruby.](http://rspec.info/)
* [Selenium/WebDriver API for Ruby][selenium_api]
* [Elemental Selenium Tips archive][selenium_tips]
* [JettyRunner document][jetty_runner]
* [Running Selenium with Headless Chrome in Ruby][headless_selenium]

## Acknowledgement

This project was initially developed by the staff of the Cornell University Libraries.




[installing_ruby]: https://www.ruby-lang.org/en/documentation/installation/
[installing_chrome]: https://support.google.com/chrome/answer/95346
[chromedriver_docs]: https://sites.google.com/a/chromium.org/chromedriver/home
[vivo_installation]: https://wiki.duraspace.org/display/VIVODOC110x/Installing+VIVO
[selenium_api]: https://seleniumhq.github.io/selenium/docs/api/rb/Selenium/WebDriver/Driver.html
[selenium_tips]: http://elementalselenium.com/tips
[jetty_runner]: https://www.eclipse.org/jetty/documentation/9.4.x/runner.html
[headless_selenium]: https://intoli.com/blog/running-selenium-with-headless-chrome-in-ruby/
