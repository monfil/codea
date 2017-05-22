require_relative 'app'

def assert(truthy)
  raise "Tests failed" unless truthy
end

p chef = Chef.find(1)

# Este es un ejemplo de test ya que los nombres de los chefs son aleatorios, este test muy probablemente fallará
p assert chef[:first_name] == 'Kendall'
p assert chef[:last_name] == 'Ernser'

todos_los_chefs = Chef.all
todas_las_comidas = Meal.all

where = Chef.where("last_name = ?", "Ernser")

Meal.find(25)

puts "finished"