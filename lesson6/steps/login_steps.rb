require "spec_helper"

 	step "I am on the login page" do
    	@loginpage = LoginPage.new
 		@loginpage.load
 	end
	
	step "I should set email and password and check remember credentials" do
		@loginpage.input_checkbox.click
		@loginpage.fill_form({email: 'vladimir.bukvic@live.com', password: 'blogpass'}).submit_form
	end

	step "I am logged in" do
		@loginpage = LoginPage.new
 		@loginpage.load
		@loginpage.input_checkbox.click
		@loginpage.fill_form({email: 'vladimir.bukvic@live.com', password: 'blogpass'}).submit_form
		expect(@loginpage).to have_content('Edit')
	end

	step "I close and open browser" do
		@newLoginpage = LoginPage.new
	end

	step "I should set email and password and check remember credentials" do
		@loginpage.input_checkbox.click
		@loginpage.fill_form({email: 'vladimir.bukvic@live.com', password: 'blogpass'}).submit_form
	end
	
	step "I should be logged in" do
		expect(@loginpage).to have_content('Edit')
		@loginpage.menu.logout_link.click
	end

	# for incorrect email and password
	step "I should set incorrect email and password and check remember credentials" do
		@loginpage.input_checkbox.click
		@loginpage.fill_form({email: 'vladimir.bukvic@incorrect.com', password: 'blogpass'}).submit_form
	end

	step "I should not be logged in" do
		expect(@loginpage).to have_content('Login')
	end