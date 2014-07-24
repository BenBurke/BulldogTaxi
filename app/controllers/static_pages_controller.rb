class StaticPagesController < ApplicationController
	
	def skip_login?
		true
	end

	def landing
    render layout: false
  end

  def about
  end

  	def logout
  		CASClient::Frameworks::Rails::Filter.logout(self)
  	end 

end
