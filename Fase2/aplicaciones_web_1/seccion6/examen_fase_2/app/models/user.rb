class User < ActiveRecord::Base
  # Remember to create a migration!
  # include BCrypt
  has_many :rounds

  validates :email, presence: true, uniqueness:true
  validates :name, :password, presence: true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Escriba una direccion válida"}
	validates :password, length: { in: 3..20 }


 # El método password es una clase de BCrypt, la cual genera el hash
 # def password
 #    @password ||= Password.new(password_digest)
 #  end

 #  def password=(user_password)
 #    @password = Password.create(user_password)
 #    self.password_digest = @password
 #  end

	def self.authenticate(email, user_password)
  	user = User.find_by(email: email)
  	if user && (user.password == user_password)
  		user
  	else
  		nil
  	end
	end
end