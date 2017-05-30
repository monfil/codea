# Este archivo sirve para crear registros de prueba
require 'csv'
CSV.foreach("flights.csv") do |row|
  if row[0] != nil and row[1] != nil and row[2] != nil and row[3] != nil and row[4] != nil and row[5] != nil and row[6] != nil and row[7] != nil and
    Flight.create(num_flight: row[0], date: row[1], depart: row[2], from: row[3], to: row[4], duration: row[5], cost: row[6], passengers: row[7])
  end
end

CSV.foreach("users.csv") do |row|
  if row[0] != nil and row[1] != nil and row[2]
    User.create(name: row[0], email: row[1], admin: row[2])
  end
end