class TasksController
  
  def initialize
    @view = TasksView.new
    @logged_user = ""
    @deck_selected = ""
    @game = ""
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

  def save_game(deck, user)
    @game = Game.create(deck_id: deck, user_id: user)
  end

  def login
    login_data = @view.login_selected
    username = login_data[0]
    password = login_data[1]
    @logged_user = User.autenticate(username, password)
    if @logged_user == nil
      try_again = @view.wrong_account_message(username)
      try_again == "S" ? login : exit
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
    deck = Deck.find_by(deck_name: topic)
    @deck_selected = deck.id
    cards = Card.where(deck_id: deck.id)
  end

  def get_options(card_id)
    Option.where(card_id: card_id)
  end

  def save_answer(game, card, user_answer)
    if user_answer.correct == true
      GameAnswer.create(game_id: game.id, card_id: card.id, answer: user_answer.id, score: 1)
    else
      GameAnswer.create(game_id: game.id, card_id: card.id, answer: user_answer.id, score: 0)
    end
  end

  def resume
    right_answers = GameAnswer.where(game_id: @game.id, score: 1).count
    wrong_answers = GameAnswer.where(game_id: @game.id, score: 0).count
    @view.resume(right_answers, wrong_answers)
  end

  def play
    cards = choose_deck
    cards_array = cards.to_a.shuffle!
    save_game(@deck_selected, @logged_user.id)
    cards_array.each do |card|
      question = card.question
      options = get_options(card.id)
      user_answer = @view.print_question(question, options)
      save_answer(@game, card, user_answer) 
    end
    resume
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