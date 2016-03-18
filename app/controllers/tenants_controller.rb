class TenantsController < ApplicationController
	before_action :require_tenants_login, except: [:new, :create]
	def index
		@listings = Listing.all.limit(5).order(created_at: :desc)
		@favorites = current_user.listings
	end
	def new
	end
	def create
		tenant = Tenant.create( tenant_params )
		if tenant.save
			session[:user_id] = tenant.id
			redirect_to tenants_path
		else
			flash[:errors] = @tenant.errors.full_messages
			redirect_to tenants_new_path
		end
	end
	private
	def tenant_params
		params.require(:tenant).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
