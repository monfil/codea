class View
  def welcome
    system "clear"
    puts "*" * 87
    puts "*" * 87
    puts "Bienvenido a Maratón. Te daremos una pregunta y deberás adivinar la respuesta correcta."
    puts "\n¿Listo? ¡Arranca el juego!"
    puts "*" * 87
    puts "*" * 87
  end

  def choose_deck
    puts "\nElige con qué bajara quieres jugar:\n\n"
    puts "1. Geografía."
    puts "2. Historia."
    puts "3. Cultura general."
    gets.chomp!
  end

  def error
    puts "Has seleccionado una opción incorrecta, presiona S para intentar de nuevo, o cualquier tecla para terminar."
    gets.chomp!
  end

  def print_question(question)
    puts "\n\n", "*" * 87
    puts "\nPregunta:\n"
    puts question.question
    puts "1. #{question.answer1}."
    puts "2. #{question.answer2}."
    puts "3. #{question.answer3}."
    puts "\nIntento: "
    answer = gets.chomp!
    return_answer(answer, question)
  end

  def return_answer(answer, question)
    case answer
    when "1" then question.answer1
    when "2" then question.answer2
    when "3" then question.answer3
    else
      puts "Ingresa un valor válido."
      print_question(question)
    end
  end

  def rigth
    puts "¡Correcto!"
  end

  def wrong
    puts "¡Incorrecto!"
  end

  def exit
    system "clear"
    puts "Has salido del juego."
  end

  def resume(rigth_answers, wrong_answers)
    system "clear"
    puts "*" * 87
    puts "*" * 87
    puts "¡El juego ha terminado!"
    puts "Total de respuestas correctas: #{rigth_answers}."
    puts "Total de respuestas incorrectas: #{wrong_answers}."
  end

end