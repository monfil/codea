class User < ApplicationRecord
	has_many :games
	has_many :decks, :through => :games

  validates :username, :password, presence: true
  validates :username, uniqueness: true

	def self.authenticate(username, password)
    user = User.find_by(username: username)

    if user != nil && user.password == password
      user
    else
      nil
    end
  end
end