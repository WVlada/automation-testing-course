require 'watir-webdriver'

browsers = [:firefox, :chrome]

browsers.each do |browser_name|

	browser = Watir::Browser.new browser_name
	browser.goto 'http://demoapp.strongqa.com/'
	link = browser.link :text => "Login"

	link.click

	if browser.text.include?("Home")
			puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} passed!"
		else
			puts "#{File.basename("#{__FILE__}", '.rb')} test for #{browser_name} failed!"
		end
		browser.quit
end