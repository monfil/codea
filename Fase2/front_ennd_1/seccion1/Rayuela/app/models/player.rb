class Player < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :games, :through => :rounds

  validates :name, uniqueness: true

  def self.get_players(players)
  	players_array = []
  	players.each do |player|
  		search_player = Player.find_by(name: player)
  		if search_player == nil
  			players_array << Player.create(name: player)
  		else
  			players_array << search_player
  		end
  	end
  	players_array
  end
end
