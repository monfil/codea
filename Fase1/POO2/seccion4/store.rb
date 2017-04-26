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
    user = @store.login(email, password)
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
      @view.welcome_user(seller)
    when 'client'
      client = Client.new(email, password)
      @store.add_user(client)
      @view.welcome_user(client)
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