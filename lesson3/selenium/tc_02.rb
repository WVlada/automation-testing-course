require 'selenium-webdriver'

browsers = [:firefox, :chrome]

browsers.each do |browser_name|

	driver = Selenium::WebDriver.for browser_name
	driver.navigate.to "http://demoapp.strongqa.com/"

	# # just to be sure
	driver.manage.timeouts.implicit_wait = 3
	driver.find_element(:link_text, "Login").click

	username = driver.find_element(:id, "user_email")
	password = driver.find_element(:id, "user_password")

	username.send_keys("vladimir.bukvic@live.com")
	password.send_keys("blogpass")

	# # .click doeasnt work? had to use .submit
	driver.find_element(:name, "commit").submit


	wait = Selenium::WebDriver::Wait.new(:timeout => 3)
	wait.until { driver.page_source.include?("Signed in successfully") }

	if driver.current_url == "http://demoapp.strongqa.com/users/sign_in"
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} passed!"
	else
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} failed!"
	end
	driver.quit

end