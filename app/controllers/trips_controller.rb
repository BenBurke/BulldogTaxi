class TripsController < ApplicationController

	def new
		@user = User.find_by(netid: session[:cas_user])
		@trip = @user.trips.new
		@flight = @trip.build_flight
	end 

	def create 
		@user = User.find_by(netid: session[:cas_user])
		@trip = @user.trips.new(trip_params)
        arrival_datetime = buildDateTime(params[:arrival_date], params[:arrival_time])
		@flight = @trip.create_flight(arrival_airport: params[:arrival_airport], 
                                    departure_airport: params[:departure_airport], 
                                    trip_id: params[:trip_id], arrival_datetime: arrival_datetime, 
                                    carrier_name: params[:carrier_name])
			if @trip.save
				flash.now[:success] = "Trip Created!"
				@flight.update_attributes(trip_id: @trip.id)
				redirect_to controller: 'charges', action: 'new'
			else
				render 'new'
			end 
	end 

	def update
	end 

	def show
		@trip = Trip.find(params[:id])
		@user = User.find(@trip.user_id)
		@flight = @trip.flight
	end

	def buildDateTime(date, time)
		date = date.split("/")
		date.push(date[0])
		date.push(date[1])
		date = date[2..5].join("-")
		time = time.split(" ")
		time[0] = time[0] + ":00"
		time = time.join(" ")
		datetime = date + " " + time
        datetime.to_datetime
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
