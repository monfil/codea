class User < ActiveRecord::Base
	has_many :games
  has_many :decks, :through => :games

  def self.autenticate(username, password)
    user = User.find_by(username: username)

    if user != nil && user.password == password
      user
    else
      nil
    end
  end
end

class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :game_answers
  has_many :cards, :through => :game_answers
end

class Deck < ActiveRecord::Base
  has_many :games
  has_many :users, :through => :games
  has_many :cards

  def find_deck()
end

class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :options
  has_many :game_answers
  has_many :games, :through => :game_answers
end

class Option < ActiveRecord::Base
  belongs_to :card
end

class GameAnswer < ActiveRecord::Base
  belongs_to :game
  belongs_to :card
end