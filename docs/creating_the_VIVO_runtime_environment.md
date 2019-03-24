# Creating and controlling the VIVO runtime environment

## Starting with RSpec

As described in [How the test framework works](docs/how_the_framework_works.md), 
RSpec is configured with hooks that run:

* Before the test session.
* Before and after each test.

These hooks are defined in `configuration.rb`, which calls methods in `webserver.rb`
which invokes shell scripts, to:

* Before the session
	* Clean the output directory and create `/logs` and `/failures` within it.
* Before each test
	* Build the VIVO webapp directory `/vivo_context`, `vivosolr.war`, and the home directory `/home`.
	* Allow for last-minute changes to `/vivo_context` or `/home` (see below).
	* Start VIVO (running in JettyRunner).
* After each test
	* Stop VIVO (running in JettyRunner).
	* If the test failed, capture the diagnostic information.

## The shell scripts

Some of the logic for these hooks is implemented in the Ruby code, 
but a large amount of it is contained in four Bash shell scripts:

* `rubytests/shell_scripts/setup_session.sh`
* `rubytests/shell_scripts/setup_test.sh`
* `rubytests/shell_scripts/startup.sh`
* `rubytests/shell_scripts/shutdown.sh`

_NOTE: There is no definitive reason why this functionality should be implemented in shell scripts.
It could have been accomplished in Ruby. It seemed like it would more maintainable this way.
Time will tell._

### Environment variables

When each script is invoked, its environment includes all of the settings that were 
provided to the test framework, whether in environment variables, in a settings file,
or as defaults.

For more details on the settings, issue the `rspec` command. If any required settings 
are not specified, you will see a message describing all of the possible settings.

Another environment variable is present also: `VIVOTEST_JETTY_EXECUTABLES` points
to the directory that contains the JettyRunner jar, and `start.jar` which is (ironically)
used to stop JettyRunner.

### `setup_session.sh`

* Complains if the output directory has not been specified (by `VIVOTEST_OUTPUT_DIRECTORY`).
* If the output directory is not empty, deletes an files within it.
* Creates `/logs` and `/failures` subdirectories.

### `setup_test.sh`

* Complains if the output directory has not been specified (by `VIVOTEST_OUTPUT_DIRECTORY`).
* Complains if the VIVO project directory (git workspace) has not been specified (by `VIVOTEST_VIVO_PROJECT`).
* Complains if the directory of "injected files" has not been specified (by `VIVOTEST_INJECTED_FILES`).
	* If not otherwise specified, this should point to `rubytests/injected_files`.
* Creates the `/vivo_context` directory and populates it:
	* Copies the files from `installer/webapp/target/vivo/*` in the VIVO project directory.
	* Copies the files from `context/*` in the injected files directory.
* Creates the `/home` directory and populates it:
	* Copies the files from `installer/home/target/vivo-installer-home-*` in the VIVO project directory.
	* Copies the files from `home/*` in the injected files directory.
* Creates `/vivosolr.war`
	* Copies it from `installer/solr/target/vivosolr.war` in the VIVO project directory.

### `startup.sh`

* Complains if the output directory has not been specified (by `VIVOTEST_OUTPUT_DIRECTORY`).
* Complains if the directory of Jetty executables has not been specified (by `VIVOTEST_JETTY_EXECUTABLES`).
	* This should point to `rubytests/jetty`. 
	* __*TO DO*__ Modify `settings.rb` so this can be overridden.
* Starts JettyRunner
	* Hosts both VIVO and Solr.
	* Specifies the `/home` directory to both VIVO and Solr.
	* Directs the Jetty logs to the `/logs` directory.
	* Specifies `catalina.base` so VIVO and Solr will write their logs to the `/logs` directory. 

### `shutdown.sh`

* Complains if the directory of Jetty executables has not been specified (by `VIVOTEST_JETTY_EXECUTABLES`).
* Runs `start.jar` to send a shutdown command to JettyRunner.

## Injected files

These files are modifications that are made to the VIVO build, in order to make VIVO run successfully 
in the test framework.
Files are injected into the VIVO context and into the home directory.

By default, `VIVOTEST_INJECTED_FILES` points to `rubytests/injected_files`. 
It can be overridden in environment variables or the settings file.

* In the VIVO context
	* `context/WEB-INF/lib/catalina.jar`
		* VIVO depends on a servlet filters that is part of Tomcat: `org.apache.catalina.filters.ExpiresFilter`
		* This JAR file provides that filter (and a whole bunch of other stuff).
	* `context/WEB-INF/resources/startup_listeners.txt`
		* At startup, VIVO runs the Solr smoke test, regardless of whether VIVO is configured
		  to use Solr or some other search engine.
		* This file removes the Solr smoke test from the startup sequence.
* In the home directory
	* `home/config/applicationSetup.n3`
		* This must be manually created as part of the VIVO installation. It is created here.
		* This version uses TDB for the content triple store, as well as for the configuration triple store.
	* `home/config/runtime.properties`
		* This must be manually created as part of the VIVO installation. It is created here.
	* `home/rdf/auth/firsttime/testing_accounts.n3`
		* An RDF file that establishes four user accounts in VIVO. These accounts are recorded as 
		  having logged on once already, so they do not need to change passwords at login.
		* The accounts are:
			* testAdmin@mydomain.edu, role=Admin, password="Password"
			* johnCurator@mydomain.edu, role=Curator, password="Password"
			* sallyEditor@mydomain.edu, role=Editor, password="Password"
			* joeUser@mydomain.edu, role=SelfEditor, password="Password"

## Last-minute changes to the runtime environment

In each test, you may write a `before_starting_server()` method that will run after the runtime environment
has been created, but before JettyRunner is started.

This method is useful for adding or replacing files for an individual test.

Here is a method that adds an RDF file which will be loaded at startup:

```
  def before_starting_server
    source = File.expand_path("TestSearchExclusion.n3", File.dirname(__FILE__))
      dest = File.expand_path("home/rdf/display/everytime", $settings.output_path)
      FileUtils.cp(source, dest)
  end

```

Here is another method. This one adds a Freemarker template that will be used in the test.

```
  def before_starting_server
    template = File.expand_path("view-browse-faculty.ftl", File.dirname(__FILE__))
    template_target = File.expand_path("vivo_context/themes/wilma/templates", $settings.output_path)
    FileUtils.copy(template, template_target)
  end
```

`before_starting_server` must be defined at the top level of the test (inside the top-level `describe`),
or it will be ignored.

Remember that the VIVO context and the home directory are rebuilt for each test, 
so changes that you make in one test do not affect other tests.