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
    $browser.find_element(:link_text, "Log in").click
    expect($browser.title).to eq("Log in - VIVO")

    $browser.find_element(:name, "loginName").send_keys(email)
    $browser.find_element(:name, "loginPassword").send_keys(password)
    $browser.find_element(:name, "loginForm").click
    browser_wait_for_jQuery
  end

  #
  # Go to the home page and login.
  #
  # Useful if the login link isn't present on the current page. Especially 
  # useful at the beginning of the test.
  #
  def vivo_login_from_home_page_as(email, password)
    $browser.navigate.to vivo_url("/")
    expect($browser.title).to eq("VIVO")
    vivo_login_as(email, password)
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
    puts "      wait %.2f seconds for indexing" % [end_time.to_f - start_time.to_f]
  end

  #
  # Click on the specified element, and then wait for search indexing.
  #
  def vivo_click_and_wait_for_indexing(how, what)
    $browser.find_element(how, what).click
    vivo_wait_for_indexing
  end
  
  #
  # Turn a relative VIVO URL into an absolute one. 
  #
  # Insure that the base and the page are joined by exactly one '/'.
  #
  def vivo_url(page)
    first_part = $settings.vivo_base_url.chomp('/')
    between = page.start_with?('/') ? '' : '/'
    first_part + between + page
  end

end