#############################################################
#                      PREREQUISITES                        #
#############################################################
Given /^I opened HomePage$/ do
  HomePage.open
end

####################################
#              ACTIONS             #
####################################

When /^I press (.*)$/ do |button|
  HomePage.given.click_login
end

####################################
#              CHECKS              #
####################################

Then /^displayed text on screen should be(.*)$/ do |output|
   expect(HomePage.given.text).to include("#{output}")
end