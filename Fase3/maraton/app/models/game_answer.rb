class GameAnswer < ApplicationRecord
	belongs_to :game
	belongs_to :card
end
