get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/game' do
		p "*" * 70
		p players = [params[:player1], params[:player2]]
		@players_array = Player.get_players(players)
	if request.xhr?
		# Si hubo una petidión ajax renderiza la vista parcial
		erb :_game, layout: false
	end
end

post '/results' do
	p "*" * 70
	p res_array = params[:resultados]
	p player1 = res_array[0]
	p index1 = res_array[1]
	p player2 =  res_array[2]
	p index2 = res_array[3]

	p "** LO QUE SE VA A MANDAR"
	p @players = [player1, player2]
	p scores = [index1.to_i, index2.to_i]
	game = Game.create()
	p "**** NEW ROUND" * 4
	p new_round = Round.new_round(game, @players, scores)
 	if request.xhr?
 		p "****HUBO PETICIÓN AJAX" * 5
 		erb :_stats, layout: false
 	end
end