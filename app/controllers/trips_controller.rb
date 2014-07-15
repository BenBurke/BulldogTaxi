class TripsController < ApplicationController

	def new
		@user = User.find_by(netid: session[:cas_user])
		@trip = @user.trips.new
	end 

	def create 
		@user = User.find_by(netid: session[:cas_user])
		@trip = @user.trips.new(trip_params)
		if @trip.save
			flash[:success]= "Welcome to the Sample App!"
  		redirect_to @trip
  	else
  		render 'new'
  	end
	end 

	def update
	end 

	def show
		@trip = Trip.find(params[:id])
	end 


	private
		def user_params
			params.require(:user).permit(:name, :email)
   	end 

   	def trip_params
   		params.require(:trip).permit(:flight_number, :confirmation)
   	end 


end
