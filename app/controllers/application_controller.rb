class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

	def current_user
	  @user ||= User.find_by(id: session[:user_id])
	  if @user
	  	puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	  	return @user
	  else
	  	@user ||= Landlord.find_by(id: session[:user_id])
	  	return @user
	  end
	end

	helper_method :current_user
end
