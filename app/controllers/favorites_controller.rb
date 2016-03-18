class FavoritesController < ApplicationController
	def create
		listing = Listing.find(params[:listing])
		if current_user.has_attribute?(:image_url)
			Favorite.create(user: current_user, listing: listing)
		else 
			Favorite.create(tenant: current_user, listing:listing)
		end
		redirect_to tenants_path
	end
	def destroy
		Favorite.destroy(params[:id])
		redirect_to tenants_path
	end 
end