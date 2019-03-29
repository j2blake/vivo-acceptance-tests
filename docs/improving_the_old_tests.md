# How to improve the old acceptance tests


#TBD


* The old tests were not written, they were recorded.

	* The output of the recorder was not always. For example, the recorder creates this:

		```	
		$browser.find_element(:xpath, ".//div[@id='wrapper-content']/ul/li[10]").click
		```
 
	  When this could have created this instead:

		```	
       $browser.find_element(:css, "ul.propertyTabsList li[groupname='service']").click

		```
		
		These expressions accomplish the same thing. Which has the more obvious intent?
 
* The old tests were written in a very limited language (Selenese)
	* It did not allow subroutines or macros
	* It had only limited support for comments
* The old tests were converted from Selenese using an automated converter.
	* 
