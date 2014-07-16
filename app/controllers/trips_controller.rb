class TripsController < ApplicationController

	def new
		@user = User.find_by(netid: session[:cas_user])
		@trip = @user.trips.new
		@flight = @trip.build_flight
	end 

	def create 
		@user = User.find_by(netid: session[:cas_user])
		@trip = @user.trips.new(trip_params)
		@flight = @trip.create_flight(arrival_airport: params[:arrival_airport], departure_airport: params[:departure_airport], trip_id: params[:trip_id])
			if @trip.save
				flash[:success] = "Trip Created!"
				@flight.update_attributes(trip_id: @trip.id)
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

   	# def flight_params
   	# 	params.require(:flight_attributes).permit(:departure_airport)
   	# end 

end
