class Game < ApplicationRecord
	belongs_to :user
	belongs_to :deck
	has_many :game_answers
	has_many :cards, :through => :game_answers
end
