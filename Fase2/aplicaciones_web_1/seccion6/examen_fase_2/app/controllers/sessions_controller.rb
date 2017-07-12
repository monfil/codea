# GETS ============================================

get '/signin' do
	erb :signin
end

get '/logout' do
  #¿Qué va en esta parte para cerrar la sesión?
	session.clear
	erb :index
end

# POSTS ============================================

post '/signin' do
  #¿Qué va en esta parte para ingresar al juego?
  p "*** SIGN IN" *5
  p @user = User.authenticate(params[:email], params[:password])
	if @user
  	session[:id] = @user.id
  	erb :secret
  else
  	@errors = session[:errors]
  	erb :signin
  end

end
