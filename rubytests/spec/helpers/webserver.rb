class Webserver
  #
  private # --------------------------------------------------------------------
  #
  def script_options(stdout_path = nil, stderr_path = nil)
    options = {}
    options[:out] = File.expand_path(stdout_path, $settings.output_path) if stdout_path
    options[:err] = File.expand_path(stderr_path, $settings.output_path) if stderr_path
    options
  end

  def run_setup_session_script
    unless system(@env, "sh", $settings.webserver_shell_scripts("setup_session.sh"), script_options)
      raise "Session setup script failed: '#{script}'."
    end
  end

  def run_setup_test_script
    system(@env, "sh", $settings.webserver_shell_scripts("setup_test.sh"), script_options)
  end

  def run_start_script
    options = script_options("logs/start_stdout.txt", "logs/start_stderr.txt")
    spawn(@env, "sh", $settings.webserver_shell_scripts("startup.sh"), options)
  end

  def get_vivo_home_page
    begin
      response = Net::HTTP.get_response(URI($settings.vivo_base_url))
      response.value
    rescue
      return false
    else
      return true
    end
  end

  def try_repeatedly_to_get_vivo_home_page
    message = ""

    (1..20).each do
      puts "     Trying..."
      if get_vivo_home_page
        puts "     Started."
        puts ""
        return true
      else
        message = $!.to_s
        sleep(3)
      end
    end

    puts "     Give up: message = #{message}"
    puts ""
    return false
  end

  def run_stop_script
    options = script_options("logs/stop_stdout.txt", "logs/stop_stderr.txt")
    system(@env, "sh", $settings.webserver_shell_scripts("shutdown.sh"), options)
  end

  public # ---------------------------------------------------------------------

  def initialize
    @env = $settings.script_environment
  end

  def running?
    get_vivo_home_page
  end

  def start
    puts "     ----- Starting the server"
    run_start_script
    sleep(10)
    exit 1 unless try_repeatedly_to_get_vivo_home_page
  end

  def stop
    puts "     ----- Stopping the server"
    run_stop_script
    sleep(5)
  end

  def setup_session
    puts "     ----- Setting up the session"
    run_setup_session_script
  end

  def setup_test
    puts "     ----- Setting up the test"
    run_setup_test_script
  end
end