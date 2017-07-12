# GETS ============================================

get '/signup' do
	erb :signup
end


# POSTS ============================================

post '/signup' do
  #¿Qué va en esta parte para registrar al jugador?
	# name = params[:name]
	# email = params[:email]
	# password = params[:password]
	@user = User.new(name: params[:name], email: params[:email], password: params[:password])
	if @user.save
		p "Sesion ***" * 5
		p session[:id] = @user.id
		erb :secret
	else
		@errors = session[:errors]
		erb :signup
	end
end