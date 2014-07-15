class ApplicationController < ActionController::Base

  before_filter CASClient::Frameworks::Rails::Filter, :unless => :skip_login?

  before_filter :getMe

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
 
	def getMe
	  @me = User.find_or_create_by_netid( session[:cas_user] )
	  if !@me
	    redirect_to :root
	    return false
	  end
	end

	# hack for skip_before_filter with CAS
	# overwrite this method (with 'true') in any controller you want to skip CAS authentication
	def skip_login? 
	  false 
	end	
 

end
