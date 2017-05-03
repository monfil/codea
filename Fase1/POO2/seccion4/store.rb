require_relative 'model.rb'
require_relative 'view.rb'

class MainControler
  def initialize
    @store = Store.new
    @view = View.new
    @option = @view.main_menu
  end

  def admin_options(option)
    case option
    when "1"
      
    when "2"
      product_index
    when "3"

    when "4"

    when "5"

    when "6"

    when "7"
      exit
    else
      admin_options(@view.error)
    end
  end

  def delete_product
    id = @view.delete_product
    
  end

  def product_index
    product_array = @store.product_index
    @view.print_product_index(product_array)
  end

  def delete_users
  end

  def user_index
  end

  def seller_options(option)
    case option
    when "1"
      product_index
    when "2"
      add_product
    when "3"

    when "4"

    when "5"

    when "6"
      exit
    else
      seller_options(@view.error)
    end
  end
  
  def add_product
    product = @view.add_product_selected
    description = product[0]
    price = product[1]
    new_product = Product.new(description, price)
    @store.add_product(new_product)
  end

  def update_product
  end

  def client_options(option)
    case option
    when "1"

    when "2"
    
    when "3"
      exit
    else
      client_options(@view.error)
    end
  end

  def buy
  end

  def login
    login_data = @view.login_selected
    email = login_data[0]
    password = login_data[1]
    p logged_user = @store.login(email, password)
    if logged_user == nil
      try_again = @view.wrong_account_message(email)
      try_again == "Y" ? login : exit
    else
      type = logged_user.class.to_s
      case type
      when "Admin"
        option = @view.admin_menu(logged_user)
        admin_options(option)
      when "Seller"
        option = @view.seller_menu(logged_user)
        seller_options(option)
      when "Client"
        option = @view.admin_client(logged_user)
        client_options(option)
      end
    end
  end

  def register
    user_data = @view.register_selected
    email = user_data[0]
    password = user_data[1]
    type = user_data[2]
    case user_data[2]
    when 'seller'
      seller = Seller.new(email, password)
      @store.add_user(seller)
      logged_user = Seller.new(email, password)
      @view.successful_registration
      @view.seller_menu(logged_user)  
    when 'client'
      client = Client.new(email, password)
      @store.add_user(client)
      logged_user = Client.new(email, password)
      @view.successful_registration
      @view.client_menu(logged_user)
    end
  end

  def exit
    @view.exit_selected
  end

  def error
    @option = @view.error
    selected_option
  end

  def selected_option
    case @option
    when "1"
      login
    when "2"
      register
    when "3"
      exit
    else
      error
    end
  end
end

MainControler.new.selected_option