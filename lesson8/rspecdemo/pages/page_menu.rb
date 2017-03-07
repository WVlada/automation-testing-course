module PageMenu

  def self.included(base)
    base.class_eval do

      add_locator :log_in, xpath: "//a[@href='login.html']"
      
      add_locator :region_news, xpath: "//a[@href='region/index.1.html']"
      add_locator :economy_news, xpath: "//a[@href='ekonomija/index.1.html']"
      add_locator :culture_news, xpath: "//a[@href='kultura/index.1.html']"
      add_locator :sport_news, xpath: "//a[@href='sport/index.1.html']"

    end

  end

end