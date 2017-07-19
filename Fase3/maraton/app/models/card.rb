class Card < ApplicationRecord
	belongs_to :deck
	has_many :options
	has_many :game_answers
	has_many :games, :through => :game_answers
end
