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