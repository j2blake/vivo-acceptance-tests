# Helper methods provided to the tests

## Browser helpers

* `browser_page_text`
	* Get the text of the current browser page.
	* Example: `expect(browser_page_text).to include("wonderful professor")`
* `browser_find_select_list(selector, value)`
   * Locate a drop-down selection element in the page. 
   * Just a convenience method to help with a surprisingly cumbersome Selenium process.
   * Example: `browser_find_select_list(:id, "VClassURI").select_by(:text, "Librarian")`
* `browser_fill_tinyMCE(text)`
	* Locate a TinyMCE box (within an IFrame), and enter data.
	* Example: `browser_fill_tinyMCE("Jane is a wonderful professor")`
* `browser_wait_for_jQuery`
	* Wait for any JQuery processes to complete.
	* This allows proper timing for page elements that rely on AJAX or JavaScript.
	* Example: `browser_wait_for_jQuery `
* `browser_accept_alert(expected_text)`
	* Assert than an alert dialog box exists with the expected text, and accept it.
	* Example: `browser_accept_alert("Are you SURE you want to delete this individual?")`

## VIVO helpers

* `vivo_login_as(email, password)`
	* Log in to VIVO, using the `Login` link at the top of the page.
	* Example: `vivo_login_as("testAdmin@mydomain.edu", "Password")`
* `vivo_login_from_home_page_as(email, password)`
	* Navigate to the VIVO home page, and logs in.
	* Useful when the browser is not currently pointing to a page with a `Login` link.
	* Example: `vivo_login_from_home_page_as("testAdmin@mydomain.edu", "Password")`
* `vivo_logout`
	* Log out from VIVO, using the `Logout` link at the top of the page.
	* Example: `vivo_logout`
* `vivo_wait_for_indexing`
	* Wait for the search indexer in VIVO to complete its task.
	* Pauses for 2 seconds to let the indexer get started, then polls every 3 seconds till complete.
	* Example: `vivo_wait_for_indexing `
* `vivo_click_and_wait_for_indexing(how, what)`
	* Click on a button or link and wait for the search indexer.
	* A simple convenience method.
	* Example: `vivo_click_and_wait_for_indexing(:id, "submit")`
* `vivo_url(page)`
	* Convert the page path to a full URL in the VIVO application.
	* Example: `browser.navigate.to vivo_url("/people")`
* `vivo_select_tab_on_profile(groupname)`
	* Select a tab on an individual profile page, by groupname
	* This is handy because it is clearer than the alternatives.
	* This is annoying because I don't know why the alternatives would
	  not work in all situations,
	* Example: `vivo_select_tab_on_profile('affiliation')`