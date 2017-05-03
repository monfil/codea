class View
  def main_menu
    system "clear"
    puts "*" * 62
    puts "\nWelcome to the online store **Tlanemani**, (www.tlanemani.com)"
    puts "\n", "*" * 62
    puts "\nSelect an   option number:\n\n"
    puts "1. Login."
    puts "2. Register."
    puts "3. Exit.\n\n"
    gets.chomp!
  end

  def login_selected
    system  "clear"
    login_data = []
    puts "Email: "
    login_data << gets.chomp!
    puts "\nPassword: "
    login_data << gets.chomp!
    login_data
  end

  def register_selected
    system  "clear"
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

  def admin_menu(user)
    welcome_user(user)
    puts "\nSelect an option number:\n\n"
    puts "1. Delete products."
    puts "2. Products index."
    puts "3. Delete users."
    puts "4. Users index."
    puts "5. Logout."
    gets.chomp!
  end

  def delete_product
    puts "\nPlease, enter the id of the product to delete:\n\n"
    gets.chomp!
  end

  def print_product_index(product_array)
    system "clear"
    puts "*" * 62
    puts " \t\t\t \n*** Product list ***"
    puts "\n", "*" * 62, "\n"
    product_array.each_with_index do |product, index|
      puts "#{index + 1}. #{product.description} ---> $ #{product.price}"
    end
  end

  def seller_menu(user)
    welcome_user(user)
    puts "\nSelect an option number:\n\n"
    puts "1. Products index."
    puts "2. Add a product."
    puts "3. Update a product."
    puts "4. Delete a product."
    puts "5. Logout."
    gets.chomp!
  end

  def client_menu(user)
    welcome_user(user)
    puts "\nSelect an option number:\n\n"
    puts "1. Products index."
    puts "2. Buy."
    puts "3. Logout."
    gets.chomp!
  end

  def welcome_user(user)
    system  "clear"
    puts "*" * 62
    puts "\n Welcome, #{user.email} \t\t\tType: #{user.class}"
    puts "\n", "*" * 62
  end

  def successful_registration
    system  "clear"
    puts "*" * 65
    puts "\n\nYour registration has been successful, press any key to continue."
    puts "\n\n", "*" * 65
    gets
  end

  def wrong_account_message(email)
    system "clear"
    puts "*" * (93 + email.length)
    puts "\n\nThe account <<#{email}>> and the password doesn't match. Press Y to try again, or any key to exit.\n"
    puts "\n\n", "*" * (93 + email.length)
    gets.upcase.chomp!
  end

  def exit_selected
    system  "clear"
    puts "*" * 62
    puts "\nYou've left from the store.\n\n"
    puts "*" * 62
  end

  def error
    system "clear"
    puts "*" * 68
    puts "You've selected an incorrect option, please enter a valid option: \n\n"
    puts "*" * 68
    gets.chomp!
  end

  def add_product_selected
    system  "clear"
    product = []
    puts "\nPlease, enter the description of the: "
    product << gets.chomp!
    puts "\nPlease, enter the price of the product: "
    product << gets.chomp!
    product
  end

end