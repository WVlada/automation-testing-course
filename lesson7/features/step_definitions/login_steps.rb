require_relative '../../pages.rb'

Given (/^I am at site$/) do
    @loginpage = LoginPage.new
 	@loginpage.load
end

Given /I enter (.*) for email and (.*) for pass/  do |mail, pass|
	@loginpage.fill_form({email: mail, password: pass}).submit_form
end

Then /Page should have link (.*)/ do |string|
	#@loginpage.has_content?('#{string}')
	a = 1
end
