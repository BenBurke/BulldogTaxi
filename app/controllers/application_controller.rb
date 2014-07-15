class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Add this before filter to force CAS Authentication on all controllers + actions
  before_filter CASClient::Frameworks::Rails::Filter, :unless => :skip_login?

  # And their protected methods
  protected

	def getMe
		@me = User.find_or_create_by_netid( session[:cas_user] )
		if !@me
			redirect_to :root
			return false
		end
	end

	def checksignin
	if session[:cas_user] == nil
		@signedin = false
	else
		getMe
		@signedin = true
	end
end

	# hack for skip_before_filter with CAS
	# overwrite this method (with 'true') in any controller you want to skip CAS authentication
	def skip_login? 
  	false 
	end

end
