require 'net/http'

class VivoHelper
  def vivo_url(page)
    "http://localhost:8080/vivo%s" % [page]
  end
  
  # TODO if logging, write the elapsed time.
  def wait_for_indexing
    puts "wait from #{Time.new}"
    res = Net::HTTP.get_response(URI(vivo_url("/admin/wait")))
    puts "wait till #{Time.new}, code=#{res.code}"
  end
end