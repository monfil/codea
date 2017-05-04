require_relative 'model.rb'
require_relative 'view.rb'

class MainControler

  @@rigth_answers = 0
  @@wrong_answers = 0

  def initialize
    @game = Game.new
    @view = View.new
  end

  def choose_deck
    deck_option = @view.choose_deck
    if deck_option != "1" && deck_option != "2" && deck_option != "3"
      again = @view.error
      if again.upcase == "S"
        choose_deck
      else
        @view.exit
        return nil
      end
    else
      return selected_deck(deck_option)
    end
  end

  def selected_deck(option)
    case option
    when "1"
      deck = "geografia.csv"
    when "2"
      deck = "historia.csv"
    when "3"
      deck = "cultura_general.csv"
    end
    deck
  end

  def count(value)
    if value == true
      @@rigth_answers += 1
    else
      @@wrong_answers += 1
    end 
  end

  def analyze_user_answer(answer, rigth_answer)
    if answer == rigth_answer
      count(true)
      @view.rigth
    else
      count(false)
      @view.wrong
    end
  end

  def resume
    @view.resume(@@rigth_answers, @@wrong_answers)
  end

  def play
    @view.welcome
    deck = choose_deck
    if deck != nil
      cards = @game.get_cards(deck)
      shuffled_cards = @game.shuffle(cards)
    end
    shuffled_cards.each do |question|
      user_answer = @view.print_question(question)
      analyze_user_answer(user_answer, question.rigth_answer)
    end
    resume
  end

end

MainControler.new.play