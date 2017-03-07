require 'spec_helper'

RSpec.feature 'Find a Sign up Page and try to Sign Up' do
 	#SignInPage.open
  
 	  	scenario 'All blank fields shouldn`t sign me up' do
 		    SignUpPage.open.fill_form(
 		     	user_name_input: '',
 				password_input: '',
  				password_input_confirmation: '',
  			 	email_input: '',
  			 	user_display_name1: '',
  			 	user_display_name2: ''
  			)
 		    .submit_form
		    	
 		    	expect(SignUpPage.given.text).to include("Morate")
   		end

   		scenario 'Different passwords shouldn`t sign me up' do
 		    SignUpPage.open.fill_form(
 		    	password_input: "VladimirPass",
                password_input_confirmation: "PassVladimir").submit_form
		    	
 		    	expect(SignUpPage.given.text).to include("Morate uneti identične lozinke")
   		end

   		scenario 'Invalid email pattern shouldn`t sign me up' do
 		    SignUpPage.open.fill_form(
 		    	email_input: "@com.gmail").submit_form
		    	
 		    	expect(SignUpPage.given.text).to include("Neispravna email adresa.")
   		end

end