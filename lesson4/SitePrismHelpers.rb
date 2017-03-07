module Prism
	
	EMAIL = "vladimir.bukvic@live.com"
	PASSWORD = "blogpass"

	INVALIDEMAIL = "vladimir.bukvic@incorrect.com"
	INVALIDPASSWORD = "blogIncorrect"

	BLANKEMAIL = ""
	BLANKPASSWORD = ""

	def print_info(page, method, *args)
		if page.public_send(*args)
		   #puts "#{File.basename("#{__FILE__}", '.rb')} test passed!"
		   puts "#{method.capitalize} passed!"
  		 else
  		   puts "#{method.capitalize} failed!"
  		 end
  	end

  	def close_page (page)
  		page.windows.each do |window|
     	window.close
   		end
	end

end