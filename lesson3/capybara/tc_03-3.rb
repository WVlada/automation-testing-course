require 'capybara'
browsers = [[:selenium, :firefox], [:selenium_chrome, :chrome]]
Capybara.register_driver :selenium_chrome do |app|
		Capybara::Selenium::Driver.new(app, :browser => :chrome)
	end

browsers.each do |browser_name|

	session = Capybara::Session.new(browser_name[0], browser_name[1])
	
	session.visit('http://demoapp.strongqa.com/')

	session.click_link('Login')

	session.fill_in('user_email', :with => 'vladimir.bukvic@live.com')
	session.fill_in('user_password', :with => 'blogpass')
	session.check('user_remember_me')

	session.find_field('user_password').native.send_key(:enter)
	
	# logout should delete cookies
	session.click_link('Logout')

	# accesing cookies of underlyng driver
	all_cookies = session.driver.browser.manage.all_cookies
	
	session.windows.each do |window|
		window.close
	end
	
	session = Capybara::Session.new(browser_name[0], browser_name[1])
	session.visit('http://demoapp.strongqa.com/')
	session.driver.browser.manage.add_cookie(all_cookies[0])
	session.driver.browser.navigate.refresh
	
	if session.has_content?('Sign up')
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name[1]} passed!"
	else
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name[1]} failed!"
	end
	
	session.windows.each do |window|
		window.close
	end

end