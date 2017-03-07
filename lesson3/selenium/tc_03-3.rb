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

	# TEST 3.3

	all_cookies = driver.manage.all_cookies

	driver.close

	driver = Selenium::WebDriver.for :firefox
	driver.navigate.to "http://demoapp.strongqa.com"
	driver.manage.add_cookie(all_cookies[0])
	driver.navigate.refresh
	driver.navigate.to "http://demoapp.strongqa.com/users/sign_in"


	if driver.page_source.include?("You are already signed in")
		puts "tc 03-2 test passed!"
	else
		puts "tc 03-2 test failed!"
	end

	driver.find_element(:link_text, "Logout").click
	
	all_cookies = driver.manage.all_cookies
	driver.close

	driver = Selenium::WebDriver.for :firefox
	driver.navigate.to "http://demoapp.strongqa.com"
	driver.manage.add_cookie(all_cookies[0])
	driver.navigate.refresh
	driver.navigate.to "http://demoapp.strongqa.com/users/sign_in"
	
	if driver.page_source.include?("Log in")
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} passed!"
	else
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} failed!"
	end
	driver.quit
end


