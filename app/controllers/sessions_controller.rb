class SessionsController < ApplicationController
	def create 
		@user = User.from_omniauth(request.env['omniauth.auth'])
		if @user
			session[:user_id] = @user.id
			flash[:success] = "Welcome, #{@user.name}!"
			redirect_to tenants_path
		else
			flash[:warning] = "There was an error while trying to authenticate you.."
			redirect_to root_path
		end
	end
	def create_new
		status = Landlord.check_session({"email" => params[:email], "password" => params[:password]})
		if status
			session[:user_id] = status[:id]
			redirect_to landlords_path
		else 
			status = Tenant.check_session({"email" => params[:email], "password" => params[:password]})
			if status
				session[:user_id] = status[:id]
				redirect_to tenants_path
			else
				flash[:error] = "Invalid username or password"
				redirect_to root_path
			end
		end
	end

	def destroy
    	session[:user_id] = nil
    	redirect_to root_path
	end
end
