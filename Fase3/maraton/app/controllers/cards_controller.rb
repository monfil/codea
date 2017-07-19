class CardsController < ApplicationController

	def get_cards
		p "*** CARDS IN PARAMS CONTROLLER " * 2
		p params[:game]
		p "\n\n\n"
		p game = Game.find(params[:game])
		p @deck_cards = Card.where(deck_id: game.deck_id)
		@game_answer = GameAnswer.new
		render 'game'
	end

end