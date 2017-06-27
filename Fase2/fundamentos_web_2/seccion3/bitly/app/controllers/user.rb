get '/register' do
  erb :register
end

get '/user_registed/:id' do
  erb :user_registed
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
    redirect to ('/register')
  end

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