class View
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario
  # Los siguientes métodos son sólo un ejemplo:

  def welcome_menu
    system "clear"
    puts "*" * 78
    puts "\t\tBienvenido a Vuelos Codea"
    puts "*" * 78
    puts "1) Reservaciones"
    puts "2) Administrador"
    puts "3) Salir"
    puts "\nSelecciona opción: "
    gets.chomp!
  end

  def login_selected
    system  "clear"
    login_data = []
    puts "*" * 78
    puts "Bienvenido Administrador"
    puts "\nIngrese usuario: "
    login_data << gets.chomp!
    puts "\nIngrese contraseña: "
    login_data << gets.chomp!
    login_data
  end

  def wrong_account_message(email)
    system "clear"
    puts "*" * (123 + email.length)
    puts "\n\nEl usuario <<#{email}>> no existe y/o la contraseña no coincide. Presiona S para intentar de nuevo, o cualquier tecla para salir.\n"
    puts "\n\n", "*" * (123 + email.length)
    gets.upcase.chomp!
  end
  
  def exit_selected
    system  "clear"
    puts "*" * 78
    puts "\n\t\tHa salido de Vuelos Codea.\n\n"
    puts "*" * 78
  end

  def admin_menu
    system  "clear"
    puts "*" * 78
    puts "\t\t\tBienvenido Administrador"
    puts "*" * 78
    puts "1) Muestra todos los vuelos"
    puts "2) Muestra todas las reservaciones"
    puts "3) Crea un nuevo vuelo"
    puts "4) Salir"
    puts "\nSeleccione una opción: "
    gets.chomp!
  end

  def show_flight(flight)
    puts "*" * 78
    puts "Número de vuelo: #{flight.num_flight}"
    puts "Date: #{flight.date} Depart: #{flight.depart} From: #{flight.from}"
    puts "To: #{flight.to} Duration: #{flight.duration} Precio: #{flight.cost} Lugares: #{flight.passengers}\n\n"
  end

  def show_booking(booking)
    puts "*" * 78
    puts "Número de reservación: #{booking.num_booking} Flight ID: #{booking.flight_id} Total: $ #{booking.total}\n\n"
  end

  def get_flight_data
    flight_data = []
    system "clear"
    puts "*" * 68
    puts "Ingrese el número de vuelo: "
    flight_data << gets.chomp
    puts "Ingrese la fecha: "
    flight_data << gets.chomp
    puts "Ingrese la hora de salida: "
    flight_data << gets.chomp
    puts "Ingrese el origen: "
    flight_data << gets.chomp
    puts "Ingrese el destino: "
    flight_data << gets.chomp
    puts "Ingrese la duración: "
    flight_data << gets.chomp
    puts "Ingrese el precio: "
    flight_data << gets.chomp
    puts "Ingrese el número de lugares disponibles: "
    flight_data << gets.chomp
    flight_data
  end

  def booking_menu
    system "clear"
    puts "*" * 68
    puts "\t\t\t¡¡¡Bienvenido!!!"
    puts "*" * 68
    puts "1) Encuentre su boleto de avión"
    puts "2) Salir"
    puts "\n\nSeleccione una opción: "
    gets.chomp!
  end

  def get_searching_flight_data
    booking_data = []
    system "clear"
    puts "*" * 78
    puts "\t\t\t¡Encuentre su vuelo!"
    puts "*" * 78
    puts "\nOrigen: "
    booking_data << gets.chomp!
    puts "Destino: "
    booking_data << gets.chomp!
    puts "Fecha: "
    booking_data << gets.chomp!
    puts "Número de pasajeros: "
    booking_data << gets.chomp!
    booking_data
  end

  def available_flights(flights)
    system "clear"
    puts "*" * 78
    puts "\t\t\tVuelos disponibles From: #{flights[0].from} To: #{flights[0].to}"
    puts "*" * 78, "\n\n"
    flights.each_with_index do |flight, index|
      puts "#{index + 1}) No. de vuelo: #{flight.num_flight}"
      puts "Date: #{flight.date}, Depart: #{flight.depart}, From: #{flight.from}"
      puts "To: #{flight.to}, Duration: #{flight.duration}, Precio: $ #{flight.cost}, Lugares: #{flight.passengers}"
      puts "*" * 78, "\n"
    end
    puts "Seleccione su vuelo: "
    gets.chomp!
  end

  def no_flights_available
    system "clear"
    puts "*" * 78
    puts "\t\t\tNo hay vuelos disponibles."
    puts "*" * 78
    puts "\nPresione S para buscar de nuevo o cualquier tecla para salir: "
    gets.upcase.chomp!
  end

  def access_denied
    system "clear"
    puts "*" * 78
    puts "Acceso denegado."
  end

  def error
    system "clear"
    puts "*" * 78
    puts "Ha seleccionado una opción incorrecta, por favor ingrese una opción válida: \n\n"
    puts "*" * 78
    gets.chomp!
	end
end
