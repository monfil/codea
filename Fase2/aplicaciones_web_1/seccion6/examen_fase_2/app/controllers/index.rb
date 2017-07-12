before '/secret' do 
  #¿Qué va en esta parte para aplicar el filtro que da entrada al juego?
  if session[:id]
  	@user = User.find(session[:id])
		pass
  else
		erb :index
  end
end 

get '/' do
  erb :index
end

get '/secret' do
  erb :secret
end
