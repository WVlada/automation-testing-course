require 'spec_helper'
require 'capybara'
require 'site_prism'

class Menusection < SitePrism::Section
  element :login_link, "a[href='/users/sign_in']"
  element :logout_link, "a[href='/users/sign_out']"
  element :edit_account, "a[href='/users/edit']"
end

class Home < SitePrism::Page
  set_url "http://demoapp.strongqa.com/"
  section :menu, Menusection, "header"
  
  element :alert, "div[id='flash_alert']"
  element :input_user_password, "input[id='user_password']"
end

class LoginPage < SitePrism::Page
  set_url "http://demoapp.strongqa.com/users/sign_in"
  section :menu, Menusection, "header"

  element :alert, "div[id='flash_alert']"
  element :input_user_email, "input[id='user_email']"
  element :input_user_password, "input[id='user_password']"
  element :input_checkbox, "input[id='user_remember_me']"
  element :input_log_in, "input[type='submit']"
  element :edit_account, "a[href='/users/edit']"

  def fill_form(a)
    input_user_email.set a[:email]
    input_user_password.set a[:password]
    # returning self allows method chaining
    self
  end

  def submit_form
    input_log_in.native.send_key(:enter)
  end

end