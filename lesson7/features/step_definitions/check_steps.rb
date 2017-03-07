#require_relative '../../pages.rb'

Given (/^I have navigated to strongQA site$/) do
    	@homepage = Home.new
 		@homepage.load
end

Then (/^I should see Articles$/)  do
		@homepage.has_content?('Articles')
end
