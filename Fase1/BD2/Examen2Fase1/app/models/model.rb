class User < ActiveRecord::Base
	has_many :flihgts, :through => :user_flights
	has_many :bookings, :through => :user_bookings
end

class Flight < ActiveRecord::Base
 	has_many :users, :through => :user_flights
 	has_many :bookings
end

class Booking < ActiveRecord::Base
	belongs_to :flight
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
