class Webserver
  #
  private # --------------------------------------------------------------------
  #
  
  def run_setup_script
    stdout_file = File.expand_path("setup_stdout.txt", $settings.output_path)
    stderr_file = File.expand_path("setup_stderr.txt", $settings.output_path)
    system("sh", $settings.webserver_setup_script, out: stdout_file, err: stderr_file)
  end
  
  def run_start_script
    stdout_file = File.expand_path("logs/start_stdout.txt", $settings.output_path)
    stderr_file = File.expand_path("logs/start_stderr.txt", $settings.output_path)
    spawn("sh", $settings.webserver_start_script, out: stdout_file, err: stderr_file)
  end

  def get_vivo_home_page
    message = ""

    (1..20).each do
      begin
        puts "     Trying..."
        response = Net::HTTP.get_response(URI($settings.vivo_base_url))
        response.value
      rescue
        message = $!.to_s
        sleep(3)
      else
        puts "     Started."
        puts ""
        return true
      end
    end

    puts "     Give up: message = #{message}"
    puts ""
    return false
  end

  def run_stop_script
    stdout_file = File.expand_path("logs/stop_stdout.txt", $settings.output_path)
    stderr_file = File.expand_path("logs/stop_stderr.txt", $settings.output_path)
    system("sh", $settings.webserver_stop_script, out: stdout_file, err: stderr_file)
  end

  public # ---------------------------------------------------------------------

  def running?
    false
  end

  def start
    puts ""
    puts "       >>>>> STARTING THE SERVER <<<<<<"
    puts ""

    run_start_script
    sleep(10)
    exit 1 unless get_vivo_home_page
  end

  def stop
    puts ""
    puts "       >>>>> STOPPING THE SERVER <<<<<<"
    puts ""
    run_stop_script
    sleep(5)
  end
  
  def setup
    puts "BOGUS:: CHECK THAT THE OUTPUT DIRECTORY EXISTS."
    puts ""
    puts "       >>>>> SETTING UP THE ENVIRONMENT <<<<<<"
    puts ""
    run_setup_script
  end
end