require_relative 'app'

def assert(truthy)
  raise "Tests failed" unless truthy
end

p chef = Chef.find(1)

# Este es un ejemplo de test ya que los nombres de los chefs son aleatorios, este test muy probablemente fallará
p assert chef[:first_name] == 'Edd'
p assert chef[:last_name] == 'Cronin'

todos_los_chefs = Chef.all
todas_las_comidas = Meal.all

where = Chef.where("first_name = ?", "Taki")

Meal.find(25)

#chef = Chef.create(first_name: "Taki", last_name: "Hernández", email:"taki_rip_in_piss@gmail.com", phone:"930-028-2908 x7555", birthday:Time.now)

chef = Chef.new(id: 28, first_name: "Takki", last_name: "Hdez", email:"takki_rip_in_piss@gmail.com", phone:"----", birthday:Time.now)
#chef.update!

puts "finished"