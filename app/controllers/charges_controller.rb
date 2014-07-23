class ChargesController < ApplicationController

  def index
    redirect_to :root
  end

  def new
    @user = User.find_by(netid: session[:cas_user])
    @trip = @user.trips.first
    @flight = @trip.flight
    @price = getPrice(@user)
  end

  def create
    @user = User.find_by(netid: session[:cas_user])
    @trip = @user.trips.first
    @flight = @trip.flight
    @price = getPrice(@user)

    # Amount in cents
    @amount = @price*100

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
      @trip.update_attributes(payment_status: true)
      flash.now[:success] = "Payment processed! Thanks " + @user.name.split(" ")[0] + ", you should receive a confirmation email shortly."
      @tokens = @user.tokens
      @trip_count = @user.trip_count + 1
      @user.update_attributes(trip_count: @trip_count)
      TripMailer.trip_purchase_confirmation(@trip).deliver
      if @tokens >= 1
        @tokens = @user.tokens - 1 
        @user.update_attributes(tokens: @tokens)
      end 
      if @user.parent_id != nil && @user.trips.count == 1
        @parent = User.find(@user.parent_id)
        @parent_tokens = @parent.tokens + 1
        @parent.update_attributes(tokens: @parent_tokens)
      end
    else
      flash.now[:error] = "Payment failed, please try again"
    end 
  
  rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path 
  end

  def show
    redirect_to :root
  end

  def getPrice(user)
    if user.tokens >= 1
      price = 45
    else
      price = 50
    end 
    return price
  end 
end
