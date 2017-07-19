class GamesController < ApplicationController

	def settings
		redirect_to deck_show_path
	end

	def show
		@decks = Deck.all
	end

	def new
		@game = Game.new
	end

	def create
		p "*** games#create " * 5
		p params[:deck_id]
		p @game = Game.create(deck_id: params[:deck_id], user_id: session[:id])
		redirect_to game_cards_path(@game)
	end

	def score
		p "*** Formulario de respuestas " * 2
		p params
	end

end
