require_relative 'page_menu'

class HomePage < WebPage
  URL = '/'
  
  add_link_locator :archive, 'Arhiva'

  add_locator :log_in, xpath: "//a[@href='login.html'][1]"

  validates :url, pattern: /http:\/\/www.e-novine.com\//
  
  def click_login
    # capybara method
    #click_link('Login') 

    # capybara method with howitzer element
    find(locator(:log_in)).click 
  end
  
  
end
