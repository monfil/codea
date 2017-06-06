class TasksView
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario

	def main_menu
    system "clear"
    puts "*" * 62
    puts "\n\t\tBienvenido a Maratón"
    puts "\n", "*" * 62
    puts "\nSelecciona una opción:\n\n"
    puts "1. Login."
    puts "2. Registrarse."
    puts "3. Salir.\n\n"
    gets.chomp!
  end

  def login_selected
    system  "clear"
    login_data = []
    puts "*" * 62
    puts "Por favor, ingresa tu username: "
    login_data << gets.chomp!
    puts "\nPor favor, ingresa tu password: "
    login_data << gets.chomp!
    login_data
  end

  def wrong_account_message(username)
    system "clear"
    puts "*" * (93 + username.length)
    puts "\n\nEl username <<#{username}>> no coinciden. Presiona Y para intentar de nuevo, o cualquier tecla para salir.\n"
    puts "\n\n", "*" * (93 + username.length)
    gets.upcase.chomp!
  end


  def exit_selected
    system  "clear"
    puts "*" * 62
    puts "\n\t\tHas salido del juego.\n\n"
    puts "*" * 62
    gets
  end

  def error
    system "clear"
    puts "*" * 68
    puts "Has seleccionado una opción incorrecta, por favor ingresa una opción válida: \n\n"
    puts "*" * 68
    gets.chomp!
  end

  def choose_deck
    system "clear"
    puts "*" * 87
    puts "*" * 87
    puts "Bienvenido a Maratón. Te daremos una pregunta y deberás adivinar la respuesta correcta."
    puts "\n¿Listo? ¡Arranca el juego!"
    puts "\n", "*" * 87
    puts "*" * 87
    puts "\nSelecciona el tema:\n\n"
    puts "1. Cultura general."
    puts "2. Geografía."
    gets.chomp!
  end

    def error_deck
    puts "Has seleccionado una opción incorrecta, presiona S para intentar de nuevo, o cualquier tecla para terminar."
    gets.chomp!
  end

end