class TripsController < ApplicationController

	def new
		@user = User.find_by(netid: session[:cas_user])

		@trip = @user.trips.new
		@flight = @trip.build_flight
    	@carriers = Carrier.all
    	@airports = Airport.all

	end 

	def create 
		@user = User.find_by(netid: session[:cas_user])
		@trip = @user.trips.new(trip_params)
        arrival_datetime = buildDateTime(params[:arrival_date], params[:arrival_time])
		@flight = @trip.create_flight(arrival_airport_id: params[:arrival_airport_id], 
                                    departure_airport: params[:departure_airport], 
                                    trip_id: params[:trip_id], arrival_datetime: arrival_datetime, 
                                    carrier_id: params[:carrier_id])
			if @trip.save
				flash.now[:success] = "Trip Created!"
				@flight.update_attributes(trip_id: @trip.id,
                                         carrier_name: Carrier.find(params[:carrier_id]).name,
                                         arrival_airport: Airport.find(params[:arrival_airport_id]).name)
				redirect_to controller: 'charges', action: 'new'
			else
				render 'new'
			end 
	end 

	def update

		 @trip = Trip.find(params[:id])
		 @flight = @trip.flight
			if @trip.update_attributes(trip_params)
		    	arrival_datetime = buildDateTime(params[:arrival_date], params[:arrival_time])
					@flight.update_attributes(arrival_airport_id: params[:arrival_airport_id], 
		                                    departure_airport: params[:departure_airport], 
		                                    trip_id: params[:trip_id], arrival_datetime: arrival_datetime, 
		                                    carrier_id: params[:carrier_id])
						flash.now[:success] = "Trip Updated!"
						@flight.update_attributes(trip_id: @trip.id,
		                                         carrier_name: Carrier.find(params[:carrier_id]).name,
		                                         arrival_airport: Airport.find(params[:arrival_airport_id]).name)
						if @trip.payment_status == false
							redirect_to controller: 'charges', action: 'new'
						else
							redirect_to @trip
						end
			end
	end 

	def show
		@trip = Trip.find(params[:id])
		@user = User.find(@trip.user_id)
		@flight = @trip.flight
	end

	def edit
		@trip = Trip.find(params[:id])
		@user = User.find(@trip.user_id)
		@flight = @trip.flight
		@carriers = Carrier.all
    	@airports = Airport.all
	end

	def index
		@user = User.find_by(netid: session[:cas_user])
		if @user.netid == 'bwb28' || @user.netid == 'pwc32'	
			@flights = sortFlights(Flight.all)
		else
			redirect_to :root
		end 
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

	def sortFlights(flights)
		flights.sort_by {|arrival| arrival[:arrival_datetime]}
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
