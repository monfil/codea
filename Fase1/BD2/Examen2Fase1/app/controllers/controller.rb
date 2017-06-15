class Controller 
  def initialize
    @logged_user = ""
    # @admin_option = ""
    @view = View.new
    option = @view.welcome_menu
    selected_option(option)
  end

  def selected_option(option)
    case option
    when "1"
      #booking
    when "2"
      admin
    when "3"
      exit
    else
      error
    end
  end

  def booking
    
  end

  def admin
    login_data = @view.login_selected
    email = login_data[0]
    password = login_data[1]
    p @logged_user = User.autenticate(email, password)
    if @logged_user == nil
      try_again = @view.wrong_account_message(email)
      try_again == "S" ? admin : exit
    elsif @logged_user.admin == true
      admin_option = @view.admin_menu
      admin_options(admin_option)
    else

    end
  end

  def admin_options(admin_option)
    case admin_option
    when "1"
      show_flights
    when "2"
      show_bookings
    when "3"
    when "4"
      exit
    else
      admin_options(@view.error)
    end
  end

  def show_flights
    all_flights = Flight.all
    all_flights.each do |flight|
      @view.show_flight(flight)
    end
  end

  def show_bookings
    all_bookings = Booking.all
    all_bookings.each do |booking|
      @view.show_booking(booking)
    end
  end

  def error
    option = @view.error
    selected_option(option)
  end

  def exit
    @view.exit_selected
  end
  # def index
  #   # TIP: Aquí debes de llamar al método del mismo nombre de @view
  # end

  # def add
  
  # end

  # def delete
  # end

  # def complete
  # end
end
