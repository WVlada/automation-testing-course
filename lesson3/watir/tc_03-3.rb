require 'watir-webdriver'

browsers = [:firefox, :chrome]

browsers.each do |browser_name|

	browser = Watir::Browser.new browser_name
	browser.goto 'http://demoapp.strongqa.com/users/sign_in'

	mailfield = browser.text_field :id => 'user_email'
	userfield = browser.text_field :id => 'user_password'
	radio = browser.checkbox :id => "user_remember_me"

	mailfield.set 'vladimir.bukvic@live.com'
	userfield.set 'blogpass'
	radio.set

	browser.form(:id, "new_user").submit
	all_cookies = browser.cookies.to_a.clone

	if browser.text.include?("Signed in successfully")
		puts "Test passed"
	else
		puts "Test failed"
	end

	browser.link(:text =>"Logout").when_present.click
	
	if browser.text.include?("Signed out successfully.")
		all_cookies = browser.cookies.to_a.clone
		browser.close

		browser = Watir::Browser.new
		browser.cookies.clear
		browser.goto 'http://demoapp.strongqa.com/users/sign_in'

		unless all_cookies.empty?
			
		all_cookies.each do |saved_cookie|
		 	x = saved_cookie[:name]
		 	y = saved_cookie[:value]
		 	z = saved_cookie[:domain]
		 	browser.cookies.add(x,y, saved_cookie)
		end

		end

		browser.goto 'http://demoapp.strongqa.com/users/sign_in'

		if browser.text.include?("Log in")
				puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} passed!"
			else
				puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} failed!"
			end
		browser.quit

	else
		puts "please click \"Logout\" link"
	end

end