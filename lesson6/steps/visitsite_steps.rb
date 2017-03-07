require "spec_helper"

 	step "I am on the home page" do
    	@homepage = Home.new
 		@homepage.load
 	end

	step "I should see Login link or Logout link" do
		expect(@homepage).to have_content('Articles') 
	end
	