require 'capybara'
require 'site_prism'
require 'pry'
require_relative 'Pages'
require_relative 'SitePrismHelpers'
include Prism

Capybara.default_driver = :selenium


def testCase_01
  @page = Home.new
  @page.load
  @page.menu.login_link.click
  
  Prism.print_info(@page, __method__, :wait_for_input_user_password, 3)
  Prism.close_page @page
end

def testCase_02
  @page = LoginPage.new
  @page.load
  
  @page.input_user_email.set Prism::EMAIL
  @page.input_user_password.set Prism::PASSWORD
  @page.input_log_in.native.send_key(:enter)

  Prism.print_info(@page, __method__, :wait_for_edit_account, 5)
  Prism.close_page @page
end

def testCase_03_1
  @page = LoginPage.new
  @page.load
  
  @page.wait_for_input_user_email(3)
  @page.input_user_email.set Prism::EMAIL
  @page.input_user_password.set Prism::PASSWORD
  @page.input_checkbox.click
  
  @page.input_log_in.native.send_key(:enter)

  Prism.print_info(@page, __method__, :wait_for_edit_account, 5)
  Prism.close_page @page
end

def testCase_03_2
  @page = LoginPage.new
  @page.load
  
  @page.wait_for_input_user_email(3)
  @page.input_user_email.set Prism::EMAIL
  @page.input_user_password.set Prism::PASSWORD
  @page.input_checkbox.click
  
  @page.input_log_in.native.send_key(:enter)
  
  all_cookies = @page.current_window.session.driver.browser.manage.all_cookies

  # i cant solve problem with closing browser.
  # found 3 places where reference to browser window is kept
  # but when i close it i cant start it again.
  @newpage = Home.new
  @newpage.load
  @newpage.current_window.session.driver.browser.manage.add_cookie(all_cookies[0])
  @newpage.current_window.session.driver.browser.navigate.refresh

  Prism.print_info(@newpage.menu, __method__, :wait_for_edit_account, 5)
  Prism.close_page @newpage
end

def testCase_03_3
  @page = LoginPage.new
  @page.load
  
  @page.wait_for_input_user_email(3)
  @page.input_user_email.set Prism::EMAIL
  @page.input_user_password.set Prism::PASSWORD
  @page.input_checkbox.click
  
  @page.input_log_in.native.send_key(:enter)
  
  all_cookies = @page.current_window.session.driver.browser.manage.all_cookies
  @page.menu.logout_link.click
  all_cookies = @page.current_window.session.driver.browser.manage.all_cookies
  # i cant solve problem with closing browser.
  # found 3 places where reference to browser window is kept
  # but when i close it i cant start it again.
  @newpage = Home.new
  @newpage.load
  @newpage.current_window.session.driver.browser.manage.add_cookie(all_cookies[0])
  @newpage.current_window.session.driver.browser.navigate.refresh

  Prism.print_info(@newpage.menu, __method__, :wait_for_login_link, 5)
  Prism.close_page @newpage
end

def testCase_04_1
  @page = LoginPage.new
  @page.load
  
  @page.wait_for_input_user_email(3)
  @page.input_user_email.set Prism::EMAIL
  @page.input_user_password.set Prism::BLANKPASSWORD
  @page.input_checkbox.click
  
  @page.input_log_in.native.send_key(:enter)
  
  Prism.print_info(@page.menu, __method__, :has_login_link?)
  Prism.close_page @page
end

def testCase_04_2
  @page = LoginPage.new
  @page.load
  
  @page.wait_for_input_user_email(3)
  @page.input_user_email.set Prism::BLANKEMAIL
  @page.input_user_password.set Prism::PASSWORD
  @page.input_checkbox.click
  
  @page.input_log_in.native.send_key(:enter)
  
  Prism.print_info(@page.menu, __method__, :has_login_link?)
  Prism.close_page @page
end

def testCase_04_3
  @page = LoginPage.new
  @page.load
  
  @page.wait_for_input_user_email(3)
  @page.input_user_email.set Prism::BLANKEMAIL
  @page.input_user_password.set Prism::BLANKPASSWORD
  @page.input_checkbox.click
  
  @page.input_log_in.native.send_key(:enter)
  
  Prism.print_info(@page.menu, __method__, :has_login_link?)
  Prism.close_page @page
end

def testCase_05_1
  @page = LoginPage.new
  @page.load
  
  @page.wait_for_input_user_email(3)
  @page.input_user_email.set Prism::INVALIDEMAIL
  @page.input_user_password.set Prism::PASSWORD
  @page.input_checkbox.click
  
  @page.input_log_in.native.send_key(:enter)
  
  Prism.print_info(@page, __method__, :has_alert?)
  Prism.close_page @page
end

def testCase_05_2
  @page = LoginPage.new
  @page.load
  
  @page.wait_for_input_user_email(3)
  @page.input_user_email.set Prism::EMAIL
  @page.input_user_password.set Prism::INVALIDPASSWORD
  @page.input_checkbox.click
  
  @page.input_log_in.native.send_key(:enter)
  
  Prism.print_info(@page, __method__, :has_alert?)
  Prism.close_page @page
end

def testCase_05_3
  @page = LoginPage.new
  @page.load
  
  @page.wait_for_input_user_email(3)
  @page.input_user_email.set Prism::INVALIDEMAIL
  @page.input_user_password.set Prism::INVALIDPASSWORD
  @page.input_checkbox.click
  
  @page.input_log_in.native.send_key(:enter)
  
  Prism.print_info(@page, __method__, :has_alert?)
  Prism.close_page @page
end


#testCase_01
#testCase_02
#testCase_03_1
#testCase_03_2
#testCase_03_3
#testCase_04_1
#testCase_04_2
#testCase_04_3
#testCase_05_1
#testCase_05_2
#testCase_05_3

