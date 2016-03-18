class MainController < ApplicationController
	def index
		@listings = Listing.all.limit(5).order(created_at: :desc)
	end
end
