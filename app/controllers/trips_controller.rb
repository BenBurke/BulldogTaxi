class TripsController < ApplicationController

	def new
		@user = User.find_by(netid: session[:cas_user])
	end 
end
