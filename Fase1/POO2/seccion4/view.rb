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
    puts "Password: "
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

  def admin_menu
    puts "\nSelect an option number:\n\n"
    puts "1. Add products."
    puts "2. Delete products."
    puts "3. Update products."
    puts "4. Products index."
    puts "5. Delete users."
    puts "6. Users index."
    puts "7. Logout."
  end

  def seller_menu
    puts "\nSelect an option number:\n\n"
    puts "1. Create a catalog."
    puts "2. Delete a catalog."
    puts "3. Add products to the catalog."
    puts "4. Delete products from the catalog."
    puts "5. Catalog index."
    puts "6. Logout."
  end

  def client_menu
    puts "\nSelect an option number:\n\n"
    puts "1. Search a product."
    puts "2. Logout."
  end

  def welcome_user(user)
    system  "clear"
    puts "*" * 62
    puts "\n Welcome, #{user.email} \t\t\tType: #{user.class}"
    puts "\n", "*" * 62
    type_user = user.class.to_s
    case type_user
    when "Admin"
      admin_menu
    when "Seller"
      seller_menu
    when "Client"
      client_menu
    end
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
    puts "*" * (74 + email.length)
    puts "\n\nThe account <<#{email}>> doesn't exist. Press Y to try again, or any key to exit.\n"
    puts "\n\n", "*" * (74 + email.length)
    gets.upcase.chomp!
  end


def wrong_password_message(email)
  system "clear"
  puts "*" * (42 + email.length)
  puts "\nThe password to the account <<#{email}>> is wrong.\n\nPress Y to try again, or any key to exit.\n"
  puts "\n", "*" * (42 + email.length)
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
end