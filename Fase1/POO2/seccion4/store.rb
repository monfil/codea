require_relative 'model.rb'
require_relative 'view.rb'

class MainControler
  def initialize
    @store = Store.new
    @view = View.new
    @option = @view.main_menu
  end

  def login
    login_data = @view.login_selected
    email = login_data[0]
    password = login_data[1]
    user_login = @store.login(email, password)
    if user_login[0] == false
      try_again = @view.wrong_account_message(email)
      try_again == "Y" ? login : exit
    elsif user_login[1] == false
      try_again = @view.wrong_password_message(email)
      try_again == "Y" ? login : exit
    else
      type = user_login[2]
      case type
      when "admin"
        logged_user = Admin.new(email, password)
      when "seller"
        logged_user = Seller.new(email, password)
      when "client"
        logged_user = Client.new(email, password)
      end
      @view.welcome_user(logged_user)
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
    when 'client'
      client = Client.new(email, password)
      @store.add_user(client)
      logged_user = Client.new(email, password)
    end
    @view.successful_registration
    @view.welcome_user(logged_user)
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