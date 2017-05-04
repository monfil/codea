require_relative 'model.rb'
require_relative 'view.rb'

class MainControler
  def initialize
    @store = Store.new
    @view = View.new
    @option = @view.main_menu
    @logged_user = ""
  end

  def show_main_menu
    type = @logged_user.class.to_s
    case type
    when "Admin"
      option = @view.admin_menu(@logged_user)
      admin_options(option)
    when "Seller"
      option = @view.seller_menu(@logged_user)
      seller_options(option)
    when "Client"
      option = @view.client_menu(@logged_user)
      client_options(option)
    end
  end

  def back_menu
    @view.back_main_menu
    show_main_menu
  end

  def admin_options(option)
    case option
    when "1"
      delete_product
    when "2"
      product_index
      back_menu
    when "3"
      delete_user
    when "4"
      user_index
      back_menu
    when "5"
      exit
    else
      admin_options(@view.error)
    end
  end

  def delete_product
    product_index
    id = @view.delete_product
    product = @store.delete_product(id.to_i)
    again = @view.product_deleted_message(product)
    if again == "Y"
      delete_product
    else
      show_main_menu
    end
  end

  def product_index
    product_array = @store.product_index
    @view.print_product_index(product_array)
  end

  
  def user_index
    user_array = @store.user_index
    @view.print_user_index(user_array)
  end

  def delete_user
    user_index
    id = @view.delete_user
    user = @logged_user.delete_user(id.to_i, @store)
    again = @view.user_deleted_message(user)
    if again == "Y"
      user_product
    else
      show_main_menu
    end
  end

  def seller_options(option)
    case option
    when "1"
      product_index
      back_menu
    when "2"
      add_product
    when "3"
      update_product
    when "4"
      delete_product
    when "5"
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
    again = @view.product_added_message(new_product)
     if again == "Y"
      add_product
    else
      show_main_menu
    end
  end

  def update_product
    product_index
    id = @view.update_product
    field = @view.field_to_update
    if field == "1" || field == "2"
      new_value = @view.get_new_value
      values = @logged_user.update_product(id.to_i, field.to_i, new_value, @store)
      again = @view.update_successful_message(values)
      if again == "Y"
        update_product
      else
        show_main_menu
      end
    else
      error
      update_product
    end 
  end

  def client_options(option)
    case option
    when "1"
      product_index
      back_menu
    when "2"
      buy
    when "3"
      exit
    else
      client_options(@view.error)
    end
  end

  def buy
    product_index
    id = @view.buy_product
    description = @logged_user.buy_product(id.to_i, @store)
    again = @view.buy_successful_message(description)
    if again == "Y"
      buy
    else
      show_main_menu
    end
  end

  def login
    login_data = @view.login_selected
    email = login_data[0]
    password = login_data[1]
    p @logged_user = @store.login(email, password)
    if @logged_user == nil
      try_again = @view.wrong_account_message(email)
      try_again == "Y" ? login : exit
    else
      show_main_menu
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
      @logged_user = Seller.new(email, password)
      @view.successful_registration
      @view.seller_menu(@logged_user)  
    when 'client'
      client = Client.new(email, password)
      @store.add_user(client)
      @logged_user = Client.new(email, password)
      @view.successful_registration
      @view.client_menu(@logged_user)
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