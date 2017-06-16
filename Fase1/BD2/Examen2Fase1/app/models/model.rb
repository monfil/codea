class User < ActiveRecord::Base
  has_many :user_flights
	has_many :flights, :through => :user_flights
  has_many :user_bookings
	has_many :bookings, :through => :user_bookings

  def self.autenticate(email, password)
    user = User.find_by(email: email)

    if user != nil && user.password == password# && user.admin == true
      user
    else
      nil
    end
  end
end

class Flight < ActiveRecord::Base
  has_many :user_flights
 	has_many :users, :through => :user_flights
 	has_many :bookings

  def self.find_flights(from, to, date, passengers)
    Flight.where(from: from, to: to, date: date).where("passengers >= ?", passengers)
  end

end

class Booking < ActiveRecord::Base
	belongs_to :flight
  has_many :user_bookings
	has_many :users, :through => :user_bookings
end

class UserFlight < ActiveRecord::Base
	belongs_to :user
	belongs_to :flight
end

class UserBooking < ActiveRecord::Base
	belongs_to :booking
	belongs_to :user
end
