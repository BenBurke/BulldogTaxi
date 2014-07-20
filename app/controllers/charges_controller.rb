class ChargesController < ApplicationController

  def new
    @user = User.find_by(netid: session[:cas_user])
    @trip = @user.trips.last
    @flight = @trip.flight
  end

  def create
    @user = User.find_by(netid: session[:cas_user])
    @trip = @user.trips.last
    @flight = @trip.flight
    # Amount in cents
    @amount = 5000

    customer = Stripe::Customer.create(
      :email => @user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'

    )

    if charge.paid == true
      flash.now[:success] = "Payment processed! Thanks " + @user.name.split(" ")[0] + ", please print this form for your records"
    else
      flash.now[:error] = "Payment failed, please try again"
    end 
  
  rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path 
  end

  def show
  end
end
