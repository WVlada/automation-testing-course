require 'selenium-webdriver'

browsers = [:firefox, :chrome]

browsers.each do |browser_name|

	driver = Selenium::WebDriver.for browser_name
	driver.navigate.to "http://demoapp.strongqa.com/"
	driver.manage.timeouts.implicit_wait = 3
	driver.find_element(:link_text, "Login").click


	wait = Selenium::WebDriver::Wait.new(:timeout => 3)
	wait.until { driver.page_source.include?("<h3>Log in</h3>") }

	username = driver.find_element(:id, "user_email")
	password = driver.find_element(:id, "user_password")

	username.send_keys("vladimir.bukvic@Incorect.com")
	password.send_keys("blogpassInvalid")

	driver.find_element(:id, "user_remember_me").click
	driver.find_element(:name, "commit").submit

	if driver.page_source.include?("Invalid email or password.")
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} passed!"
	else
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} failed!"
	end
	driver.quit

end
# ALL-IN ONE SOLUTION No-5 - didnt solve POST sending error
