class TasksController
  
  def initialize
    @view = TasksView.new
    @logged_user = ""
    option = @view.main_menu
    selected_option(option)
  end

  def selected_option(option)
    case option
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

  def login
    login_data = @view.login_selected
    username = login_data[0]
    password = login_data[1]
    @logged_user = User.autenticate(username, password)
    if @logged_user == nil
      try_again = @view.wrong_account_message(username)
      try_again == "Y" ? login : exit
    else
      choose_deck
    end
  end

  def choose_deck
    deck_option = @view.choose_deck
    if deck_option != "1" && deck_option != "2"
      again = @view.error_deck
      if again.upcase == "S"
        choose_deck
      else
        @view.exit_selected
        return nil
      end
    else
      return selected_deck(deck_option)
    end
  end

  def selected_deck(option)
    case option
    when "1"
      return get_cards("Cultura general")
    when "2"
      return get_cards("Geografia")
    end
  end

  def get_cards(topic)
    p deck = Deck.find_by(deck_name: topic)
    p cards = Card.where(deck_id: deck.id)
  end

  def play
    #@view.welcome
    deck = choose_deck
    # if deck != nil
    #   cards = @game.get_cards(deck)
    #   shuffled_cards = @game.shuffle(cards)
    # end
    # shuffled_cards.each do |question|
    #   user_answer = @view.print_question(question)
    #   analyze_user_answer(user_answer, question.rigth_answer)
    # end
    # resume
  end

  def register
    puts "Orita no joven"
  end

  def exit
    @view.exit_selected
  end

  def error
    option = @view.error
    selected_option(option)
  end

end