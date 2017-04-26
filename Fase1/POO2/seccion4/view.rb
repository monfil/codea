class View
  def main_menu
    puts "\nWelcome to the online store **Tlanemani**, (www.tlanemani.com)"
    puts "-" * 62
    puts "Select an   option number: "
    puts "1. Login."
    puts "2. Register."
    puts "3. Exit.\n\n"
    gets.chomp!
  end

  def login_selected
    login_data = []
    puts "Email: "
    login_data << gets.chomp!
    puts "Password: "
    login_data << gets.chomp!
    login_data
  end

  def register_selected
    user_data = []

    ask = lambda do
      puts "1. Seller.\n2. Client.\n\n"
      type_activity = gets.chomp!
      if type_activity == "1"
       user_data << "seller"
      elsif type_activity == "2"
       user_data << "client"
      else
        puts "\nPlease, choose a valid option: "
        ask.call
      end
    end

    puts "\nPlease, enter your email: "
    user_data << gets.chomp!
    puts "\nPlease, create and enter your password: "
    user_data << gets.chomp!
    puts "\nwhat do you want to be?"
    ask.call    
    user_data
  end

  def admin_menu
    puts "Select an option number: "
    puts "1. Add products."
    puts "2. Delete products."
    puts "3. Update products."
    puts "4. Products index."
    puts "5. Delete users."
    puts "6. Users index."
    puts "7. Logout."
  end

  def seller_menu
    puts "Select an option number: "
    puts "1. Create a catalog."
    puts "2. Delete a catalog."
    puts "3. Add products to the catalog."
    puts "4. Delete products from the catalog."
    puts "5. Catalog index."
    puts "6. Logout"
  end

  def client_menu
    puts "Select an option number: "
    puts "1. Search a product."
    puts "2. Logout."
  end

  def welcome_user(user)
    puts "Welcome #{user.email}. Type: #{user.class}"
    case user.class
    when 'Admin'
      admin_menu
    when 'Seller'
      seller_menu
    when 'Client'
      client_menu
    end
  end

  def exit_selected
    puts "\nYou've left from the store.\n\n"
  end

  def error
    puts "You've selected an incorrect option, please enter a valid option: \n\n"
    gets.chomp!
  end
end