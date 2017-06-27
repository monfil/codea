get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @url_input = params[:input]
  @urls = Url.all
  erb :index
end

post '/url' do
	url_input = params[:url]
  if session[:id]
    new_short_url = Url.create(user_id: session[:id], long_url: url_input)
    redirect to("/user_profile")
  else
	 default_user = User.find(1)
	 new_short_url = Url.create(user_id: default_user.id, long_url: url_input)
	 redirect to ("/?input=1")
  end
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
    redirect to ("/user_registed/#{user.id}")
  else
    @error_name = @user.errors.messages[:name]
    @error_email = @user.errors.messages[:email]
    @error_password = @user.errors.messages[:password]
    erb :register
  end
end

get '/user_registed/:id' do
  erb :user_registed
end

post '/login' do
  if @user = User.find_by(email: params[:email], password: params[:password])
    session[:id] = @user.id
    redirect to ("/user_profile")
  else
    @error = "Wrong email or password"
    # erb :login
  end
end

get '/login' do
  erb :login
end

get '/user_profile' do
  @user = User.find(session[:id])
  @user_urls = Url.where(user_id: @user.id)
  erb :user_profile
end

get '/logout' do
  session.clear
  erb :logout
end


# post '/urls' do
# 	# crea una nueva Url
# end

# # e.g., /q6bda
# get '/:short_url' do
# 	# redirige a la URL original
# end