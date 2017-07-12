get '/score/:user_id' do
  #¿Qué va en esta parte para obtener la puntuación de cada jugador (submarinos destruidos en cada ronda) y
  #número de juegos ganados?
  p "***User scores" * 4
  p @user = User.find(params[:user_id])
  p @rounds = @user.rounds
  erb :round
end

post '/games' do
  #¿Qué va en esta parte para recibir la información del round actual, el score del jugador, el conteo de las
  #oportunidades de cada jugador, así como la sesión actual?
  if request.xhr?
    p "*** NEW GAME " * 4
    p params
    p score = params[:score]
    user_id = session[:id]
    @result = ""
    #¿Qué va en esta parte para llevar el registro de las puntuaciones por ronda?
    if score == "2"
      @result = "Winner!"
    else
      @result = "Almost!"
    end
    p "*** GAME OVER " * 4
    p @round = Round.create(user_id: user_id, destroyed_submarines: score, result: @result)
  end

  
end

post '/new_game' do
  #¿Qué va en esta parte para redirigir a secret?
 	if session[:id]
    @user = User.find(session[:id])
    erb :secret
  else
    erb :index
  end
end
