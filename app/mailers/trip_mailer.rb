class TripMailer < ActionMailer::Base
  default from: "bulldogtaxirides@gmail.com"
  add_template_helper(ApplicationHelper)

  
  def trip_purchase_confirmation(trip)
    @user = User.find(trip.user_id)
    @trip = trip
    @flight = @trip.flight
    if @user.tokens >=1
  		@price = 45
  	else
  		@price = 50
  	end 
   
    mail to: @user.email, subject: "Trip Confirmation"
  end
end
