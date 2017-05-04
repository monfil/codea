require 'csv'

class Card

  attr_accessor :question, :answer1, :answer2, :answer3, :rigth_answer

  def initialize(question, answer1, answer2, answer3,rigth_answer)
    @question = question
    @answer1 = answer1
    @answer2 = answer2
    @answer3 = answer3
    @rigth_answer = rigth_answer
  end

end

class Game

  def get_cards(deck)
    cards_array = []
    pointer = 0
    CSV.foreach(deck) do |row|
      cards_array << Card.new(row[0], row[1], row[2], row[3], row[4])
    end
    cards_array
  end
  
  def shuffle(cards_array)
    cards_array.shuffle!
  end
  
  def analyze_answer
  end

end