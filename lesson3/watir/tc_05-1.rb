require 'watir-webdriver'

browsers = [:firefox, :chrome]

browsers.each do |browser_name|
	browser = Watir::Browser.new browser_name
	browser.goto 'http://demoapp.strongqa.com/users/sign_in'

	mailfield = browser.text_field :id => 'user_email'
	userfield = browser.text_field :id => 'user_password'
	radio = browser.checkbox :id => "user_remember_me"

	mailfield.set 'vladimir@gmail.com'
	userfield.set 'blogpass'
	radio.set

	browser.form(:id, "new_user").submit

	if browser.text.include?("Invalid email or password")
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} passed!"
	else
		puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} failed!"
	end
	browser.quit

end