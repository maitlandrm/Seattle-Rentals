class LandlordsController < ApplicationController

	def index
		@listings = current_user.listings
	end

	def new
	end

	def create
		landlord = Landlord.create( landlord_params )
		if landlord.save
			session[:user_id] = landlord.id
			redirect_to landlords_path
		else
			flash[:errors] = @landlord.errors.full_messages
			redirect_to landlords_new_path
		end
	end

	private
	def landlord_params
		params.require(:landlord).permit(:first_name, :last_name, :email, :business, :password, :password_confirmation)
	end
end
