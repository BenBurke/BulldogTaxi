class UsersController < ApplicationController
  def new
  	@user = User.find_by(netid: session[:cas_user])
  end
  def index
  end 
  def update
  	@user = User.find_by(netid: session[:cas_user])
    params[:user][:phone_number] = phoneNumber(params[:user][:phone_number])
  	if @user.update_attributes(user_params)
  		flash[:success] = "Account Created"
  		redirect_to controller: 'trips', action: 'new'
  	end 
  end 
  def show
  	@user = User.find_by(netid: session[:cas_user])
  end 

  def phoneNumber(input)
    if input.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
      result = [$1, $2, $3].join("")
      return result.to_i
    end
  end 

  private
   def user_params
   	params.require(:user).permit(:name, :email, :phone_number)
   end
end
