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

	# a workaround? - finaly succesded after several hours :)
	session.find_field('user_password').native.send_key(:enter)

	#if Capybara.page.has_content?('Signed in')
	if session.has_content?('Signed in')
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name[1]} passed!"
	else
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name[1]} failed!"
	end
	
	session.windows.each do |window|
		window.close
	end
end