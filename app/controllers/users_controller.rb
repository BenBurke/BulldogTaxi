class UsersController < ApplicationController
  def new
  end
  def index
  end 
  def update
  	@user = User.find_by(netid: session[:cas_user])
  	if @user.update_attributes(user_params)
  		flash[:success] = "Account Created"
  		redirect_to @user
  	end 
  end 
  def show
  	@user = User.find_by(netid: session[:cas_user])
  end 

  private
   def user_params
   	params.require(:user).permit(:name, :email)
   end
end
