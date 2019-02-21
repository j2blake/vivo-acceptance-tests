require 'net/http'

class VivoHelper
  def vivo_url(page)
    "http://localhost:8080/vivo%s" % [page]
  end
  
  # TODO if logging, write the elapsed time.
  def wait_for_indexing
    start_time = Time.new
    sleep(2)
    puts "wait from #{start_time}"
    res = Net::HTTP.get_response(URI(vivo_url("/admin/wait")))
    end_time = Time.new
    puts "wait till #{end_time}, code=#{res.code}"
    puts "wait #{end_time.to_i - start_time.to_i} seconds."
  end
end