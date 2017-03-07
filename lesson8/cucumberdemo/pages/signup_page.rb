#require_relative 'page_menu'

class SignUpPage < WebPage
  URL = '/login.html'

  validates :element_presence, locator: :register_form

  add_locator :register_form, css: '#register_form'
  #add_locator :sign_in_btn, xpath: ".//*[@id='register_form']/div[10]/div/input"
  
  add_field_locator :user_name_input, 'USER_username'
  add_field_locator :password_input, 'USER_password'
  add_field_locator :password_input_confirmation, 'USER_retype_password'
  add_field_locator :email_input, 'USER_email_address'

  add_field_locator :user_display_name1, 'USER_first_name'
  add_field_locator :user_display_name2, 'USER_last_name'

  # why this doesnt work?
  #add_locator :agree_with_terms, '[name=USER_TOS]'
  add_locator :agree_with_terms, xpath: ".//input[@name='USER_TOS']"

  add_locator :submit_button, xpath: ".//*[@id='register_form']/div[10]/div/input"

  add_locator :error_message, xpath: ".//*[@id='error_message']"

  include PageMenu
  
  def fill_form( user_name_input: nil,
                 password_input: nil,
                 password_input_confirmation: nil,
                 email_input: nil,
                 user_display_name1: nil,
                 user_display_name2: nil,
                 agree_with_terms: nil )
    log.info "Fill in Login Form with data: user name: #{user_name_input},
                                            password: #{password_input},
                                            password_input_confirmation: #{password_input_confirmation},
                                            email_input: #{email_input},
                                            user_display_name1: #{user_display_name1},
                                            user_display_name2: #{user_display_name2},
                                            agree_with_terms: #{agree_with_terms}"
                                            
    fill_in(field_locator(:user_name_input), with: user_name_input) unless user_name_input.nil?
    fill_in(field_locator(:password_input), with: password_input) unless password_input.nil?
    fill_in(field_locator(:password_input_confirmation), with: password_input_confirmation) unless password_input_confirmation.nil?
    fill_in(field_locator(:email_input), with: email_input) unless email_input.nil?
    fill_in(field_locator(:user_display_name1), with: user_display_name1) unless user_display_name1.nil?
    fill_in(field_locator(:user_display_name2), with: user_display_name2) unless user_display_name2.nil?
    
    #check(locator(:agree_with_terms))
    #check("input[name='USER_TOS']")
    self
  end

  def submit_form
    log.info "Submit Login Form"
    log.info "Form submitted!"
    find(locator(:submit_button)).native.send_key(:enter)
    # different selenium-js errors, capybara-cant locate errors
    #js_click(locator(:submit_button))
    #SignInPage.given
  end

   
end