class MainController < ApplicationController
	def index
		@listings = Listing.limit(5)
	end
end
