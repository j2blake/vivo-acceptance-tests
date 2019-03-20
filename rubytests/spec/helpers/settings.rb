#
# Establish values for all sorts of settings during the run.
#
# Full description is in the recite_settings method.
#
class Settings
  attr_accessor :output_path
  attr_accessor :failure_path
  attr_accessor :vivo_base_url
  attr_accessor :script_environment

  # ----------------------------------------------------------------------------
  private
  # ----------------------------------------------------------------------------

  #
  # These are the settings that should be treated as file paths, and resolved.
  #
  PATH_SETTINGS =
  %w{ VIVOTEST_SETTINGS VIVOTEST_OUTPUT_DIRECTORY VIVOTEST_VIVO_PROJECT } +
  %w{ VIVOTEST_SHELL_SCRIPTS VIVOTEST_INJECTED_FILES }
  #
  def get_settings_from_environment
    raw_settings = ENV.select { |k| k.start_with?("VIVOTEST_") }
    @env_settings = resolve_paths_against_current_directory(raw_settings)
  end

  def resolve_paths_against_current_directory(settings)
    path_based_settings = settings.select { |k| PATH_SETTINGS.include?(k) }
    resolved = path_based_settings.transform_values { |path| File.expand_path(path, Dir.pwd) }
    settings.merge(resolved)
  end

  def get_settings_from_file
    if filename = @env_settings["VIVOTEST_SETTINGS"]
      if File.exist?(filename)
        raw_settings = parse_settings_file(filename)
        @file_settings = resolve_paths_against_settings_file(raw_settings, filename)
      else
        raise "Settings file '#{filename}' not found."
      end
    else
      @file_settings = {}
    end
  end

  def resolve_paths_against_settings_file(settings, file)
    path_based_settings = settings.select { |k| PATH_SETTINGS.include?(k) }
    resolved = path_based_settings.transform_values { |path| File.expand_path(path, File.dirname(file)) }
    settings.merge(resolved)
  end

  def parse_settings_file(filename)
    settings = {}
    IO.readlines(filename, chomp: true).each do |line|
      if line.strip.empty?
        # blank line
      elsif line.start_with?("#")
        # comment line
      elsif m = line.match(/(\w+)=(.*)/)
        settings[m[1]] = m[2]
      else
        raise ("Invalid line '%s' in settings file '%s'" % [line, filename])
      end
    end
    settings
  end

  def combine_settings
    @settings = @file_settings.merge(@env_settings)
  end

  def validate_output_path
    @output_path = @settings["VIVOTEST_OUTPUT_DIRECTORY"]
    raise "A value for VIVOTEST_OUTPUT_DIRECTORY is required." unless @output_path
    raise "The output directory at '#{@output_path}' does not exist." unless Dir.exist?(@output_path)

    @failure_path = File.expand_path("failures", @output_path)
  end

  def validate_vivo_path
    @vivo_project_path = @settings["VIVOTEST_VIVO_PROJECT"]
    unless @vivo_project_path
      raise "A value for VIVOTEST_VIVO_PROJECT is required."
    end
    unless Dir.exist?(@vivo_project_path)
      raise "The VIVO project at '#{@vivo_project_path}' does not exist."
    end
    unless Dir.exist?(File.expand_path('installer', @vivo_project_path))
      raise "The directory at '#{@vivo_project_path}' does not look like a VIVO project (no 'installer' directory)."
    end
    unless Dir.exist?(File.expand_path('installer/webapp/target', @vivo_project_path))
      raise "The VIVO project at '#{@vivo_project_path}' must be built with 'mvn package' (or 'mvn install')."
    end
  end

  def validate_injected_files_path
    @injected_files_path = @settings["VIVOTEST_INJECTED_FILES"]
    if @injected_files_path.nil?
      @injected_files_path = File.expand_path("../../../rubytests/injected_files", File.dirname(__FILE__))
    end
    raise "The injected files directory at '#{@injected_files_path}' does not exist." unless Dir.exist?(@injected_files_path)
  end

  def validate_shell_scripts_path
    @webserver_shell_scripts = @settings["VIVOTEST_SHELL_SCRIPTS"]
    if @webserver_shell_scripts.nil?
      @webserver_shell_scripts = File.expand_path("../../../rubytests/shell_scripts", File.dirname(__FILE__))
    end
    raise "The injected files directory at '#{@injected_files_path}' does not exist." unless Dir.exist?(@injected_files_path)
    validate_script("setup_session.sh", "Session setup script");
    validate_script("setup_test.sh", "Test setup script");
    validate_script("startup.sh", "Webserver start script");
    validate_script("shutdown.sh", "Webserver stop script");
  end

  def validate_script(filename, label)
    path = webserver_shell_scripts(filename)
    raise "#{label} does not exist: '#{path}'" unless File.exist?(path)
  end

  def validate_vivo_url
    @vivo_base_url = @settings["VIVOTEST_VIVO_URL"]
    if @vivo_base_url.nil?
      @vivo_base_url = "http://localhost:8080/vivo/"
    end
  end
  
  def validate_jetty_executables
    # Seriously. Hard-code it, relative to here.
    @jetty_executables = File.expand_path("../../../rubytests/jetty", File.dirname(__FILE__))
  end

  def create_script_environment
    @script_environment = {
      "VIVOTEST_OUTPUT_DIRECTORY" => @output_path,
      "VIVOTEST_VIVO_PROJECT" => @vivo_project_path,
      "VIVOTEST_INJECTED_FILES" => @injected_files_path,
      "VIVOTEST_JETTY_EXECUTABLES" => @jetty_executables,
    }
  end

  # ----------------------------------------------------------------------------
  public
  # ----------------------------------------------------------------------------

  def initialize
    begin
      get_settings_from_environment
      get_settings_from_file
      combine_settings

      validate_output_path
      validate_vivo_path
      validate_injected_files_path
      validate_shell_scripts_path
      validate_vivo_url
      validate_jetty_executables

      create_script_environment
    rescue
      puts $!
      recite_settings
      raise $!
    end
  end

  def webserver_shell_scripts(filename)
    File.expand_path(filename, @webserver_shell_scripts)
  end

  def recite_settings
    #    puts <<~HEREDOC
    #
    #    Required settings:
    #      VIVOTEST_OUTPUT_DIRECTORY
    #        The directory where the results will be written. Must already exist.
    #      VIVOTEST_VIVO_PROJECT
    #        The VIVO project directory for the VIVO under test. Must already
    #        exist. Must contain 'target' directories from the Maven build process.
    #
    #    Optional settings:
    #      VIVOTEST_SETTINGS
    #        A file containing other settings in a NAME=value format.
    #      VIVOTEST_SHELL_SCRIPTS
    #        The directory that contains setup_session.sh, setup_test.sh, startup.sh
    #        and shutdown.sh. Defaults to a "shell_scripts" directory in this
    #        workspace.
    #      VIVOTEST_INJECTED_FILES
    #        The directory that contains files to be injected into the VIVO home
    #        directory (/home), and perhaps the VIVO context also (/context).
    #      VIVOTEST_VIVO_URL
    #        The base URL of the VIVO application in the web server. Defaults to
    #        http://localhost:8080/vivo
    #
    #     Values may be specified by environment variables. Any relative paths are
    #     relative to the current working directory.
    #        For example: VIVOTEST_OUTPUT_DIRECTORY=/usr/jeb228/vivotest/output rspec
    #
    #     Values may be specified in a settings file, which is specified by an
    #     environment variable.
    #        For example: VIVOTEST_SETTINGS=/usr/jeb228/vivotest/settings rspec
    #     Each line in the settings file is in the form [var-name]=[value]
    #     Blank lines and comment lines (starting with '#') are also permitted.
    #     Any relative paths are relative to the settings file itself.
    #
    #     Environment variables override values from the settings file.
    #
    #     HEREDOC
  end
end