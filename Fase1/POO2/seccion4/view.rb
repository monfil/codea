class View
  def main_menu
    puts "\nWelcome to the online store **Tlanemani**, (www.tlanemani.com)"
    puts "----------------------------------------------------------------"
    puts "Select option number: "
    puts "1. Login."
    puts "2. Register."
    puts "3. Exit.\n\n"
    gets.chomp!
  end

  def register_selected
    user_data = []
    puts "Please, enter your email: "
    user_data << gets.chomp!
    puts "Please, create and enter your password: "
    user_data << gets.chomp!
    user_data
  end

  def exit_selected
    puts "\nYou've left from the store.\n\n"
  end

  def error
    puts "You've selected an incorrect option, please enter a valid option: \n\n"
    gets.chomp!
  end
end