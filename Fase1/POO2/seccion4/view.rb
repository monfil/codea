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

  def welcome_user(user)
    system  "clear"
    puts "*" * 62
    puts "\n Welcome, #{user.email} \t\t\tType: #{user.class}"
    puts "\n", "*" * 62
  end

  def wrong_account_message(email)
    system "clear"
    puts "*" * (93 + email.length)
    puts "\n\nThe account <<#{email}>> and the password doesn't match. Press Y to try again, or any key to exit.\n"
    puts "\n\n", "*" * (93 + email.length)
    gets.upcase.chomp!
  end

  def successful_registration
    system  "clear"
    puts "*" * 65
    puts "\n\nYour registration has been successfully, press any key to continue."
    puts "\n\n", "*" * 65
    gets
  end

  def admin_menu(user)
    welcome_user(user)
    puts "\nSelect an option number:\n\n"
    puts "1. Delete products."
    puts "2. Product index."
    puts "3. Delete users."
    puts "4. User index."
    puts "5. Logout."
    gets.chomp!
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

  def delete_product
    puts "\nPlease, enter the id of the product to delete:\n\n"
    gets.chomp!
  end

  def product_deleted_message(description)
    system "clear"
    puts "*" * (60 + description.length)
    puts "\n#{description} was deleted successfully."
    puts "\nDo you want delete another product?"
    puts "Press Y to delete another product, or any key to back to the main menu.\n\n"
    puts "*" * (60 + description.length)
    gets.upcase.chomp!
  end

  def print_product_index(product_array)
    system "clear"
    puts "*" * 50
    puts "\n*** Product list ***"
    puts "\n", "*" * 50, "\n"
    product_array.each_with_index do |product, index|
      puts "#{index + 1}. #{product.description} ---> $ #{product.price}"
    end
  end

  def delete_user
    puts "\nPlease, enter the id of the user to delete:\n\n"
    gets.chomp!
  end
  
  def user_deleted_message(user)
    system "clear"
    puts "*" * (60 + user.length)
    puts "\nThe user #{user} was deleted successfully."
    puts "\nDo you want delete another user?"
    puts "Press Y to delete another user, or any key to back to the main menu.\n\n"
    puts "*" * (60 + user.length)
    gets.upcase.chomp!
  end

  def print_user_index(user_array)
    system "clear"
    puts "*" * 50
    puts "\n*** User list ***"
    puts "\n", "*" * 50, "\n"
    user_array.each_with_index do |user, index|
      puts "#{index + 1}. #{user.email} ---> #{user.class}"
    end
  end

  def add_product_selected
    system  "clear"
    product = []
    puts "\nPlease, enter the description of the product: "
    product << gets.chomp!
    puts "\nPlease, enter the price of the product: "
    product << gets.chomp!
    product
  end

  def product_added_message(product)
    system "clear"
    puts "*" * (69 + product.description.length) 
    puts "\n\"#{product.description}\" was added successfully."
    puts "\nDo you want add another product?"
    puts "Press Y to add another product, or any key to back to the main menu.\n"
    puts "\n", "*" * (69 + product.description.length)
    gets.upcase.chomp!
  end

  def update_product
    puts "\nPlease, enter the id of the product to update:\n"
    gets.chomp!
  end

  def field_to_update
    puts "\nWhat do you want to update?"
    puts "1. Description"
    puts "2. Price."
    gets.chomp!
  end

  def get_new_value
    puts "\nPlease enter the new value:\n"
    gets.chomp!
  end

  def back_main_menu
    puts "\n\n", "*" * 50
    puts "\nPress any key to back to the main menu.\n"
    gets.chomp! 
  end

  def update_successful_message(values)
    system "clear"
    puts "*" * (73 + values[0].length + values[1].length)
    puts "\nThe \"#{values[0]}\" has been updatet to \"#{values[1]}\" successfully."
    puts "Press Y to update another product, or any key to back to the main menu.\n\n"
    puts "*" * (73 + values[0].length + values[1].length)
    gets.upcase.chomp!
  end

  def buy_product
    puts "\nPlease, enter the id of the product to buy:\n"
    gets.chomp!
  end

  def buy_successful_message(product)
    system "clear"
    puts "*" * (69 + product.length) 
    puts "\n Your buy of the product \"#{product}\" was successfully."
    puts "\nDo you want buy another product?"
    puts "Press Y to buy another product, or any key to back to the main menu.\n"
    puts "\n", "*" * (69 + product.length)
    gets.upcase.chomp!
  end

end