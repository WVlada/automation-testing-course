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
  section :menu, Menusection, 'header'

  element :alert, "div[id='flash_alert']"
  element :input_user_email, "input[id='user_email']"
  element :input_user_password, "input[id='user_password']"
  element :input_checkbox, "input[id='user_remember_me']"
  element :input_log_in, "input[type='submit']"
  element :edit_account, "a[href='/users/edit']"
end