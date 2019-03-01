#
# Some useful methods for manipulating VIVO.
#
module VivoHelpers
  #
  # Login.
  #
  # Throw an exception if not successful.
  #
  def vivo_login_as(email, password)
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")

    $browser.find_element(:link_text, "Log in").click
    expect($browser.title).to eq("Log in - VIVO")

    $browser.find_element(:name, "loginName").send_keys(email)
    $browser.find_element(:name, "loginPassword").send_keys(password)
    $browser.find_element(:name, "loginForm").click
    
    # If login failed, we will still be on the login page.
    expect($browser.title).to eq("VIVO")
  end

  #
  # Logout.
  #
  # Note that the logout link is not visible until you hover over the user menu.
  #
  def vivo_logout
    admin_menu = $browser.find_element(:id, "user-menu")
    $browser.action.move_to(admin_menu).perform
    $browser.find_element(:link_text, "Log out").click
  end

  #
  # Wait for search indexing.
  #
  # Wait a short time for the indexing to begin, then call /admin/wait to wait 
  # for it to end.
  #
  def vivo_wait_for_indexing
    start_time = Time.new
    sleep(2)

    Net::HTTP.get_response(URI(vivo_url("/admin/wait"))).value

    end_time = Time.new
    puts "%.2f seconds" % [end_time.to_f - start_time.to_f]
  end

  #
  # Turn a relative VIVO URL into an absolute one.
  #
  # The relative URL should begin with a '/'
  #
  # TODO - get the base URL from Settings, join with a slash if needed.
  #
  def vivo_url(page)
    "http://localhost:8080/vivo%s" % [page]
  end

end