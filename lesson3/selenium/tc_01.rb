require 'selenium-webdriver'

browsers = [:firefox, :chrome]

browsers.each do |browser_name|
	
	driver = Selenium::WebDriver.for browser_name

	driver.navigate.to "http://demoapp.strongqa.com/"

	# without this part, the url returns "demoapp.strongqa.com" because
	# ruby script executes faster than page load
	wait = Selenium::WebDriver::Wait.new(:timeout => 3)
	wait.until { driver.page_source.include?("Login") }
	driver.find_element(:link_text, "Login").click

	# without this part, the url returns "demoapp.strongqa.com" because
	# ruby script executes faster than page load
	wait = Selenium::WebDriver::Wait.new(:timeout => 3)
	wait.until { driver.page_source.include?("<h3>Log in</h3>") }

	if driver.current_url == "http://demoapp.strongqa.com/users/sign_in"
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} passed!"
	else
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} failed!"
	end
	driver.quit

end