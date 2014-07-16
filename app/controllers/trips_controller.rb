class TripsController < ApplicationController

	def new
		@user = User.find_by(netid: session[:cas_user])
	end 

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Account Created"
  		redirect_to root_url
  	end 
	end 


	private
		def user_params
			params.require(:user).permit(:name, :email)
   	end 


end
