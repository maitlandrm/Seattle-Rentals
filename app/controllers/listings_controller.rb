class ListingsController < ApplicationController
	def index
	end

	def create
		CarrierWave.base_path ="/public"
		listing = current_user.listings.create(listing_params)
		if listing.save
			redirect_to '/listings/' + listing.id.to_s
		else
			flash[:errors] = listing.errors.full_messages
			redirect_to landlords_path
		end
	end

	def find 
		@listings = Listing.where(neighborhood: params[:neighborhood], price: params[:price_min]..params[:price_max])
		if @listings.length > 0 
			puts "true"
			render 'index'
		else
			flash[:warning] = "Couldn't find any matches! :("
				redirect_to root_path
		end
	end

	def show
		@listing = Listing.find(params[:id])
		flash[:listing_id] = @listing.id

	end
	def address
		@listing = Listing.find(flash[:listing_id])
		@address = @listing.address + " " + @listing.city + " " + @listing.state + " " + @listing.zip.to_s
		puts @address
		render :json => @address
	end

	def update
		listing = Listing.update(params[:id], listing_params)
		if listing.save
			redirect_to '/listings/' + listing.id.to_s	
		else
			flash[:errors] = listing.errors.full_messages
			redirect_to '/listings/' + params[:id]
		end
	end


	private
	def listing_params
		params.require(:listing).permit(:neighborhood, :address, :city, :state, :zip, :price, :category, :description, :pet_friendly, :hot_tub, :pool, :paid_utils, :baths, :half_baths, :beds, :wheelchair_accessible, {avatars:[]}, :main)
	end
end
