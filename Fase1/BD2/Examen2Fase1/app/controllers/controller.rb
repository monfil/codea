class Controller 
  def initialize
    @logged_user = ""
    @view = View.new
    option = @view.welcome_menu
    selected_option(option)
  end

  def selected_option(option)
    case option
    when "1"
      booking
    when "2"
      admin
    when "3"
      exit
    else
      error
    end
  end

  def booking
    option = @view.booking_menu
    case option
    when "1"
      find_flights
    when "2"
      exit
    else

    end
  end

  def find_flights
    search_data = @view.get_searching_flight_data
    from = search_data[0]
    to = search_data[1]
    date = search_data[2]
    passengers = search_data[3]
    available_flights = Flight.find_flights(from, to, date, passengers.to_i)
    if available_flights != []
      selected_flight = @view.available_flights(available_flights)
    else
      again = @view.no_flights_available
      again == "S" ? find_flights : exit
    end

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
      @view.acces_denied
    end
  end

  def admin_options(admin_option)
    case admin_option
    when "1"
      show_flights
    when "2"
      show_bookings
    when "3"
      create_fligth
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

  def create_fligth
    flight_data = @view.get_flight_data
    Flight.create(num_flight: flight_data[0].to_i, date: flight_data[1], depart: flight_data[2], from: flight_data[3], to: flight_data[4], duration: flight_data[5], cost: flight_data[6].to_f, passengers: flight_data[7].to_i)
  end

  def error
    option = @view.error
    selected_option(option)
  end

  def exit
    @view.exit_selected
  end
  
end
