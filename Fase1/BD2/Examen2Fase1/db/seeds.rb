# Este archivo sirve para crear registros de prueba
# require 'csv'

# CSV.foreach("flights.csv") do |row|
#   if row[0] != nil and row[1] != nil and row[2] != nil and row[3] != nil and row[4] != nil and row[5] != nil and row[6] != nil and row[7] != nil and
#     Flight.create(num_flight: row[0], date: row[1], depart: row[2], from: row[3], to: row[4], duration: row[5], cost: row[6], passengers: row[7])
#   end
# end

# CSV.foreach("users.csv") do |row|
#   if row[0] != nil and row[1] != nil and row[2]
#     User.create(name: row[0], email: row[1], admin: row[2])
#   end
# end

User.create(name: "Fabiola Monfil", email: "fab", password: "123", admin: true)
User.create(name: "Alma Hernández", email: "almi@mail.com", password: "123", admin: false)
User.create(name: "Mew Hernández", email: "mew@gmail.com", password: "123", admin: false)
User.create(name: "Calvin del Rayo", email: "calvin@mail.com", password: "123", admin: false)
User.create(name: "Chester Monfil", email: "chester@mail.com", password: "123", admin: false)
User.create(name: "Ray Juárez", email: "ray@mail.com", password: "123", admin: false)
User.create(name: "Pakitty Sánchez", email: "pakitty@mail.com", password: "123", admin: false)

Flight.create(num_flight: 96384, date: "2017-06-19", depart: "11:17:16 UTC", from: "Western Sahara", to: "Saudi Arabia", duration: "7:00:00", cost: 829.50, passengers: 8)
Flight.create(num_flight: 35472, date: "2017-06-19", depart: "13:36:40 UTC", from: "Western Sahara", to: "Saudi Arabia", duration: "7:00:00", cost: 748.45, passengers: 10)
Flight.create(num_flight: 63669, date: "2017-06-19", depart: "14:47:27 UTC", from: "Western Sahara", to: "Saudi Arabia", duration: "7:00:00", cost: 4434.0, passengers: 23)
Flight.create(num_flight: 48579, date: "2017-06-19", depart: "14:47:27 UTC", from: "Paris", to: "New York City", duration: "6:00:00", cost: 650.0, passengers: 5)
Flight.create(num_flight: 87302, date: "2017-06-19", depart: "18:00:00 UTC", from: "Buenos Aires", to: "Mexico City", duration: "5:00:00", cost: 80.5, passengers: 15)
Flight.create(num_flight: 31254, date: "2017-06-19", depart: "20:00:00 UTC", from: "New York City", to: "Helsinki", duration: "5:00:00", cost: 70.5, passengers: 10)
Flight.create(num_flight: 13453, date: "2017-06-19", depart: "08:00:00", from: "x", to: "y", duration: "01:00:00", cost: 43.0, passengers: 7)
Flight.create(num_flight: 13753, date: "2017-06-19", depart: "08:00:00", from: "x", to: "y", duration: "01:00:00", cost: 43.0, passengers: 3)
Flight.create(num_flight: 13353, date: "2017-06-19", depart: "08:00:00", from: "x", to: "y", duration: "01:00:00", cost: 43.0, passengers: 5)
Flight.create(num_flight: 13953, date: "2017-06-19", depart: "08:00:00", from: "x", to: "y", duration: "01:00:00", cost: 43.0, passengers: 1)

UserFlight.create(user_id: 1, flight_id: 1)
UserFlight.create(user_id: 2, flight_id: 1)

Booking.create(num_booking: "1701-2", flight_id: 1,total: 829.50)
Booking.create(num_booking: "1701-1", flight_id: 1,total: 829.50)

UserBooking.create(booking_id: 1, user_id: 1)
UserBooking.create(booking_id: 1, user_id: 2)