class StaticPagesController < ApplicationController
	def skip_login?
		true
	end 
	def landing
  	end

  	def logout
  		CASClient::Frameworks::Rails::Filter.logout(self)
  	end 

end
