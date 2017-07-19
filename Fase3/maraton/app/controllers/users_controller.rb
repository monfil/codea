class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new	
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
			@message = "Usuario no creado:"
			render 'new'
		end
	end

	def login
		@user = User.new
	end

	def user_authenticate
		p "*" * 40
		# p params
		p username = params[:user][:username]
		password = params[:user][:password]
		p @user = User.authenticate(username, password)
		if @user
			session[:id] = @user.id 
			redirect_to settings_path
		end
	end

	private
		def user_params
			params.require(:user).permit(:username, :password)
		end

end