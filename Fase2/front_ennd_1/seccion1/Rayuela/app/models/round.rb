class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :player
  belongs_to :game

  def self.new_round(game, players, scores)
  	index1 = scores[0]
  	index2 = scores[1]
		winner1 = 0
		winner2 = 0
		round_array = []

  	if index1 > 88 && index2 > 88
  	# Fuera del área permitida
  	elsif index1 <= 88 && index2 <= 88  
  		# Cuando ambos jugadores cayeron dentro del área permitida
  		if index1 > index2
  			winner1 = 1
  		elsif index1 < index2
  			winner2 = 1
  		elsif index1 == index2
  			winner1 = 1
  			winner2 = 1
  		end
  	# Cuando uno de los dos cayó fuera del área permitida
  	elsif index1 > 88 || index2 > 88
  		# Cuando el primer jugador cayó fuera del área permitida
  		if index1 > index2
  			winner2 = 1
  		else
  			winner1 = 1
  		end
  	end

  	# Crear registros en rounds
  	players.each do |player|
      p "*** NUEVO JUEGO" * 6
  		jugador = Player.find_by(name: player)
  		round_array << Round.create(player_id: jugador.id, game_id: game.id, score: 0)
  	end

  	round_array[0].update(score: winner1)
  	round_array[1].update(score: winner2)

  	round_array
  end

end
