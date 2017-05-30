class View
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario
  # Los siguientes métodos son sólo un ejemplo:

  def welcome_menu
    puts "Bienvenido a Vuelos Codea"
    puts "-" * 20
    puts "1) Reservaciones"
    puts "2) Administrador"
    puts "3) Salir"
    puts "\nSelecciona opción: "
    gets.chomp!
  end
  
	def index
	end

  def create
  end

  def delete
  end

  def update
  end

	def error
	end
end
