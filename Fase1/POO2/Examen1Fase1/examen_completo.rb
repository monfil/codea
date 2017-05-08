# ****************CLASES*****************
class CreditCard

    attr_accessor :name, :number, :expiration, :cvc, :status

	def initialize(name, number, expiration, cvc, status)
		@name = name
		@number = number
		@expiration = expiration
		@cvc = cvc
		@status = status
	end

end

#Cinco instancias de CreditCard
amex = CreditCard.new("Amex", 2345673444, "12/15", 2345, [234, 567, 456, 567, 344])
scotiabank = CreditCard.new("Scotiabank", 2345673744, "12/16", 2845, [234, 345, 456, 567, 344])
bancomer = CreditCard.new("Bancomer", 2345673444, "12/15", 2645, [234, 345, 456, 567, 344])
serfin = CreditCard.new("Serfin", 2345473454, "12/20", 1345, [234, 345, 456, 567, 344])
bancoppel = CreditCard.new("Bancoppel", 2345373464, "12/18", 2445, [567, 345, 456, 567, 344])

cards = [amex, scotiabank, bancomer, serfin, bancoppel]

# test
cards.each do |card|
   puts "#{card.name} responds to:"
   puts "\tName: #{card.respond_to?(:name) == true}"
   puts "\tNumber: #{card.respond_to?(:number) == true}"
   puts "\tExpiration: #{card.respond_to?(:expiration) == true}"
   puts "\tcvc: #{card.respond_to?(:cvc) == true}"
   puts "\tGet status: #{card.respond_to?(:status) == true}"
   puts "\tSet status: #{card.respond_to?(:status=) == true}"
   puts "\n\n"
end

#método para mostrar datos de tarjetas
def show_cards(cards)
	puts "-" * 94
	puts "|     name     |     number     |    expiration  |      cvc      |           status          |"
	puts "-" * 94
	cards.each do |card|
		space = 11 - card.name.length
		spaces = " " * space
		puts "|   #{card.name}#{spaces}|    #{card.number}  |      #{card.expiration}     |      #{card.cvc}     | #{card.status} |"
	end
	puts "-" * 94
end

show_cards(cards)

# *****************************HERENCIA **********************************************************
class Athlete

    attr_accessor :total_time, :speed_record, :total_distance

	def initialize(distance = 0, time = 0)
		@distance = distance
		@time = time
		@total_time = @time
		@total_distance = @distance
	end

	def speed
		@speed = (@distance / @time.to_f).round(2)
		if @speed.to_f.nan? then @speed = 0 end
	end

	def new_workout(distance = 0, time = 0)
		@distance = distance
    @time = time
    @total_time += @time
		@total_distance += @distance
	end

	def total_time
    "#{self.class}'s total time is #{@total_time}"
  end

  def total_distance
    "#{self.class}'s total distance is #{@total_distance}"
  end

  def speed_record
    "#{self.class}'s average speed is #{(@total_distance / @total_time.to_f).round(2)}"
	end

end

class Runner < Athlete

	def run
		speed
		"Ran #{@distance} meters, time: #{@time} seconds, speed: #{@speed} m/s"
	end

end

class Swimmer < Athlete

	def swim
		speed
		"Swam #{@distance} meters, time: #{@time} seconds, speed: #{@speed} m/s"
	end

end

class Cyclist < Athlete

	def ride
		speed
		"Rode #{@distance} meters, time: #{@time} seconds, speed: #{@speed} m/s"
	end

end

#tests

#instancias de atletas con distancia en metros
runner = Runner.new()
swimmer = Swimmer.new(50, 10)
cyclist = Cyclist.new(70, 27)

athletes = [runner, swimmer, cyclist]

athletes.each do |athlete|
  #¿qué tipo de atleta es?
  puts "#{athlete.class} responds to:"
  puts "\tAthlete speed: #{athlete.respond_to?(:speed) == true}"
  puts "\tGet Athlete time: #{athlete.respond_to?(:total_time) == true}"
  puts "\tSet Athlete time: #{athlete.respond_to?(:total_time=) == true}"
  puts "\tSpeed record: #{athlete.respond_to?(:speed_record) == true}"
  puts "\tGet Distance: #{athlete.respond_to?(:total_distance) == true}"
  puts "\tSet Distance: #{athlete.respond_to?(:total_distance=) == true}"
  puts "\trun method: #{athlete.respond_to?(:run) == true}" if athlete == runner
  puts "\tswim method: #{athlete.respond_to?(:swim) == true}" if athlete == swimmer
  puts "\tride_bike method: #{athlete.respond_to?(:ride_bike) == true}" if athlete == cyclist
  puts "\n\n"
end

#test for runner

#test para runner con distancia = 0
p runner.run == "Ran 0 meters, time: 0 seconds, speed: 0 m/s"
#test para runner al hacer ejercicio, incrementa distancia = 20 metros y tiempo = 7 segundos
runner.new_workout(20, 7) 
#test para runner con distancia = 20 metros y tiempo = 7 segundos
p runner.run == "Ran 20 meters, time: 7 seconds, speed: 2.86 m/s"

#test para swimmer con distancia = 50
p swimmer.swim == "Swam 50 meters, time: 10 seconds, speed: 5.0 m/s"

# ************************************** RACE CARS *****************************************************
LAP_DISTANCE = 100

class RaceCar

    attr_reader :name, :lap_times

	def initialize(name)
		@name = name
		@lap_times = laps
	end

	def laps
		laps_array = []
		5.times do
			laps_array << LAP_DISTANCE / rand(6.0..19.0)
		end
		laps_array
	end

	def average_speed
		(@lap_times.sum / @lap_times.length).round(1)
	end

	def race_car_level
		average_speed = self.average_speed
		case average_speed
		when 0..6 then "Principiante"
		when 6.1..7 then "Normal"
		when 7.1..10 then "Medio"
		when 10.1..19 then "Avanzado"
		end
	end

end

#Team class
class Team

	attr_reader :cars

	def initialize(cars)
		@cars = cars
	end

  #método para agregar nuevo race car
  def add_race_car(race_car)
  	@cars << race_car
  end

# método para calcular promedio de velocidad del equipo
	def average_speed_of_team
		sum_speed = 0
		self.cars.each do |car|
			sum_speed += car.average_speed
		end
		(sum_speed / self.cars.length).round(1)
	end

end

#método para buscar race car
def search(car, team)
	team.cars.each { |race_car| return "#{race_car.name} is a racer" if race_car.name == car }
end

#método para generar la tabla
def print_table(team)
	cars_array = name_level_car(team)
	p "-" * 36
	p "|    Name         |    Level        |"
	p "-" * 36
	cars_array.each do |row|
		space1 = 14 - row[0].length
		space2 = 14 - row[1].length
		spaces1 = " " * space1
		spaces2 = " " * space2
		p "|   #{row[0]}#{spaces1}|   #{row[1]}#{spaces2}|"
	end
		p "-" * 36
end

#método para mostrar nombre y nivel del race car
def name_level_car(team)
	team.cars.map do |race_car|
		[race_car.name, race_car.race_car_level]
	end
end


#instancias de RaceCar
car1 = RaceCar.new("Rayo McQueen")
car2 = RaceCar.new("Power")
car3 = RaceCar.new("Chick Hicks")
car4 = RaceCar.new("Sally")
car5 = RaceCar.new("Strip Weathers")
car6 = RaceCar.new("Ramon")

#tests

p "car1: #{car1.average_speed} m/s"
p "car2: #{car2.average_speed} m/s"
p "car3: #{car3.average_speed} m/s"
p "car4: #{car4.average_speed} m/s"
p "car5: #{car5.average_speed} m/s"
p "car6: #{car6.average_speed} m/s"

# #create a team of cars 
team1 = [car1, car2, car3, car4, car5]
team_one = Team.new(team1)
team_one.add_race_car(car6)


#test para buscar race car en equipo team_one
p search("Power", team_one) == "Power is a racer"

# calculate average speed of team
p team_one.average_speed_of_team

# Muestra el nivel de un racecar
p car1.race_car_level

# método para mostrar nombre y nivel del race car
p name_level_car(team_one)

# método que imprime la tabla
print_table(team_one)