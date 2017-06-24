class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :name, :format => { :with => /\A[a-zA-Z]+\z/, message: "Escriba un nombre válido"}
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Escriba una direccion válida"}
  validates :password, length: { in: 3..20 }

  def self.authenticate(email, password)
  	user = User.find_by(email: email)
  	if user != nil && user.password == password
  		user
  	else
  		nil
  	end
  end

end
