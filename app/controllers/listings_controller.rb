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
		query = "SELECT * FROM listings WHERE neighborhood = '" + params[:neighborhood] + "' AND price BETWEEN '" + params[:price_min] +"' AND '" + params[:price_max] + "'"
			if params[:pet_friendly] == "on"
				query = query + "AND pet_friendly = true "
			end
			if params[:hot_tub] == "on"
				query = query + "AND hot_tub = true "
			end
			if params[:pool] == "on"
				query = query + "AND pool = true "
			end
			if params[:paid_utils] == "on"
				query = query + "AND paid_utils = true "
			end
			if params[:wheelchair_accessible] == "on"
				query = query + "AND wheelchair_accessible = true "
			end
			if params[:bath] && params[:baths].length > 0
				query = query + "AND baths >= '" + params[:baths] + "' "
			end
			if params[:beds] && params[:beds].length > 0
				query = query + "AND beds >= '" + params[:beds] + "' "
			end
		@listings = Listing.find_by_sql(query)

		if @listings.length > 0 
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
		# address = @listing.address
		data = [@listing.address, ENV["google_maps_key"]]
		render json: data
	end

	def update
		listing = Listing.update(params[:id], listing_params)
		if listing.save
			redirect_to landlords_path	
		else
			flash[:errors] = listing.errors.full_messages
			redirect_to '/listings/' + params[:id]
		end
	end

	def destroy
		Listing.destroy(params[:id])
		redirect_to landlords_path
	end


	private
	def listing_params
		params.require(:listing).permit(:neighborhood, :address, :price, :category, :description, :pet_friendly, :hot_tub, :pool, :paid_utils, :baths, :half_baths, :beds, :wheelchair_accessible, {avatars:[]}, :main)
	end
end
