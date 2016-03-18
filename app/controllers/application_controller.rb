class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def require_tenants_login
  	if !current_user || current_user.has_attribute?(:business)
  		redirect_to '/' 
  	end
  end

  def require_landlords_login
  	if !current_user || !current_user.has_attribute?(:business)
  		redirect_to '/'
  	end
  end

  private
	def current_user
	  @user ||= User.find_by(id: session[:user_id])
	  if @user
	  	return @user
	  else
	  	@user ||= Landlord.find_by(id: session[:user_id])
	  	return @user
	  end
	end

	helper_method :current_user
end
