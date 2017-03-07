require_relative '../pages'
require 'spec_helper'
require 'capybara'
require 'capybara/rspec'

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = 'http://demoapp.strongqa.com/' 
end

RSpec.feature "Navigating to loginpage" do
		
		scenario "should go to login page when clicked login link" do
			page = Home.new
			page.load
			page.menu.login_link.click
		 	expect(page).to have_content('Login')
		end
end


RSpec.feature "Login functionality" do
		#cant make it work with
		#given(:correct_credentials) {{email: 'vladimir.bukvic@live.com', password: 'blogpass'}}

		scenario "should login with correct data" do
			# ne moze sa @page mora page
			page = LoginPage.new
			page.load
			page.fill_form({email: 'vladimir.bukvic@live.com', password: 'blogpass'}).submit_form
		 	expect(page).to have_content('Edit')
		end

		scenario "should not login with incorrect data" do
			page = LoginPage.new
			page.load
			page.fill_form({email: 'vladimir.bukvic@incorrect.com', password: 'incorrect'}).submit_form
		 	expect(page).to have_content('Invalid')
		end
		
		scenario "should login with remembering credentials" do
			page = LoginPage.new
			page.load
			page.input_checkbox.click
			page.fill_form({email: 'vladimir.bukvic@live.com', password: 'blogpass'}).submit_form
		 	expect(page).to have_content('Edit')
		end

		scenario "should be loged after window close if remember chexkbox checked" do
			page = LoginPage.new
			page.load
			page.input_checkbox.click
			page.fill_form({email: 'vladimir.bukvic@live.com', password: 'blogpass'}).submit_form
		 	all_cookies = page.current_window.session.driver.browser.manage.all_cookies
		 	
		 	newpage = Home.new
		 	newpage.load
		 	newpage.current_window.session.driver.browser.manage.add_cookie(all_cookies[0])
  			newpage.current_window.session.driver.browser.navigate.refresh
		 	expect(newpage).to have_content('Edit')
		end

		scenario "should not be loged after window close if clicked Logout" do
			page = LoginPage.new
			page.load
			page.input_checkbox.click
			page.fill_form({email: 'vladimir.bukvic@live.com', password: 'blogpass'}).submit_form
			page.menu.logout_link.click
		 	all_cookies = page.current_window.session.driver.browser.manage.all_cookies
		 	
		 	newpage = Home.new
		 	newpage.load
		 	if all_cookies != []
		 		newpage.current_window.session.driver.browser.manage.add_cookie(all_cookies[0])
		 	end
  			newpage.current_window.session.driver.browser.navigate.refresh
		 	expect(newpage).to have_content('Login')
		end

		# this will cover 4 and 5
		scenario "should not login with wrong credentials" do
			page = LoginPage.new
			page.load
			page.input_checkbox.click
			page.fill_form({email: 'vladimir.bukvic@incorect.com', password: ''}).submit_form
		 	expect(page).to have_content('Invalid')
		end

end

