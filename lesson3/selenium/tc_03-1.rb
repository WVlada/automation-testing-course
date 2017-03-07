require 'selenium-webdriver'

browsers = [:firefox, :chrome]

browsers.each do |browser_name|

	driver = Selenium::WebDriver.for browser_name
	driver.navigate.to "http://demoapp.strongqa.com/"

	driver.manage.timeouts.implicit_wait = 3
	driver.find_element(:link_text, "Login").click

	username = driver.find_element(:id, "user_email")
	password = driver.find_element(:id, "user_password")

	username.send_keys("vladimir.bukvic@live.com")
	password.send_keys("blogpass")
	driver.find_element(:id, "user_remember_me").click
	driver.find_element(:name, "commit").submit

	if driver.page_source.include?("Signed in")
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} passed!"
	else
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} failed!"
	end
	driver.quit

end
