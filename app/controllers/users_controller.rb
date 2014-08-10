class UsersController < ApplicationController
  def new
  	@user = User.find_by(netid: session[:cas_user])
  end
  def index
    redirect_to :root
  end 
  def update
  	@user = User.find_by(netid: session[:cas_user])
    # this next bit of code is designed to associate a user with a parent, thereby giving them a discout on their first trip
    if params[:parent_code] != nil && User.find_by(promo_code: params[:parent_code]) != nil 
      @parent = User.find_by(promo_code: params[:parent_code])
      @tokens = @user.tokens + 1
      @user.update_attributes(parent_id: @parent.id, tokens: @tokens)
    end
      params[:user][:phone_number] = phoneNumber(params[:user][:phone_number])
      if params[:page] == "form" # this directs the redirect based upon hidden field returns for edit.html.erb & (user)new.html.erb
      	if @user.update_attributes(user_params)
          if @user.promo_code == nil
            @user.update(promo_code: params[:user][:promo_code])
          end 
      		flash[:success] = "Welcome " + @user.fname + "!"
      		redirect_to controller: 'trips', action: 'new'
      	end
      elsif params[:page] == "edit"
        if @user.update_attributes(user_params)
          flash[:success] = "Profile Updated!"
          @user.update_attributes(college_id: params[:college_id])
          redirect_to @user
        end  
      end 
  end 
  def show
  	@user = User.find_by(netid: session[:cas_user])
    @trips = @user.trips
  end 

  def edit
    @user = User.find_by(netid: session[:cas_user])
    @colleges = College.all

  end 

  def phoneNumber(input)
    if input.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
      result = [$1, $2, $3].join("")
      return result
    end
  end 

  private
   def user_params
   	params.require(:user).permit(:fname, :lname, :email, :phone_number, :year, :college_id)
   end
end
