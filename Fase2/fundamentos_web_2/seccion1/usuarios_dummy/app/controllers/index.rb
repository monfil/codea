get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

post '/' do

end

get '/register' do
  erb :register
end

post '/register' do
	name = params[:name]
	email = params[:email]
	password = params[:password]
	user = User.new(name: name, email: email, password: password)
	if user.save
		session[:id] = user.id
		redirect to ("/user_profile/#{user.id}")
	else
		@error_name = @user.errors.messages[:name]
    @error_email = @user.errors.messages[:email]
    @error_password = @user.errors.messages[:password]
		erb :register
	end
end

get '/user_profile/:id' do
	@user = User.find(params[:id])
	erb :user_profile
end

get '/login' do
	erb :login
end

post '/login' do
	if @user = User.find_by(email: params[:email], password: params[:password])
		session[:id] = @user.id
		redirect to ("/user_profile/#{@user.id}")
	else
		@error = "Wrong email or password"
		erb :login
	end
end

get '/logout' do
	session.clear
	erb :logout
end