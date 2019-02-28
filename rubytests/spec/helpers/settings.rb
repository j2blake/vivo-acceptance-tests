class Settings
    attr_accessor :output_path
    attr_accessor :failure_path
    attr_accessor :vivo_base_url
    attr_accessor :webserver_start_script
    attr_accessor :webserver_stop_script
  def initialize
    # TODO - parameterize these
    
    # Default is within the project, relative to this script
    @output_path = "/Users/jeb228/Development/VIVO/AcceptanceTests/output/"
    
    # Default is "failures" under the output_path
    @failure_path = "/Users/jeb228/Development/VIVO/AcceptanceTests/output/failures/"
    # Should this even be offered on its own? Hard-code it as being in the output directory!!!
    
    # Default is relative to this script
    @webserver_start_script = "/Users/jeb228/Development/VIVO/AcceptanceTests/projects/vivo-acceptance-tests/scripts/setup_and_run.sh"
    @webserver_stop_script = "/Users/jeb228/Development/VIVO/AcceptanceTests/projects/vivo-acceptance-tests/scripts/shutdown.sh"
    
    # This is the default. If it has no trailing slash, add one
    @vivo_base_url = "http://localhost:8080/vivo/"
  end
end