require 'spec_helper'

RSpec.feature 'Find a homepage and login link' do
	  
	#  	scenario 'Clicking Login should open login dialog' do
	#	    HomePage.open.click_login
		    # ovo su 3 testa u stvari, moze i bilo koji samostlano
		    #expect(HomePage.given.text).to include("Prijavi se")
	#	    SignUpPage.wait_for_opened
  	#end
  	scenario 'visiting site' do
    HomePage.open
    #given je za instancu?
    expect(HomePage.given.text).to include("Static")
  end
end