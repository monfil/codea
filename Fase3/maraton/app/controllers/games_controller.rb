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
		game = params[:game]
		params.each do |k|
			if k.to_i != 0
				user_answer = Option.find(k.to_i)
				if user_answer.correct == true
					p GameAnswer.create(game_id: game, card_id: user_answer.card_id, answer: user_answer.id, score: 0)
				else
					p GameAnswer.create(game_id: game, card_id: user_answer.card_id, answer: user_answer.id, score: 0)
				end
			end
		end
		redirect_to results_path(game)
	end

	def results
		p "*" *30
		p params[:game]
		p @game_answers = GameAnswer.where(game_id: params[:game].to_i)
		render 'resume'
	end

end
