class Webserver
  #
  private # --------------------------------------------------------------------
  #
  
  def run_setup_script
    system("sh", $settings.webserver_setup_script)
  end
  
  def run_start_script
    output_file = File.expand_path("logs/stdout.txt", $settings.output_path)
    spawn("sh", $settings.webserver_start_script, out: output_file, err: output_file + "2")
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
    spawn("sh", $settings.webserver_stop_script)
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
    puts ""
    puts "       >>>>> SETTING UP THE ENVIRONMENT <<<<<<"
    puts ""
    run_setup_script
  end
end