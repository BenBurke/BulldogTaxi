class TripMailer < ActionMailer::Base
  default from: "bulldogtaxirides@gmail.com"

  
  def trip_purchase_confirmation(trip)
    @user = User.find(trip.user_id)
    @trip = trip
    @flight = @trip.flight
   

    mail to: @user.email, subject: "Trip Confirmation"
  end
end
