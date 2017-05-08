require 'csv'

class CreditCard

	attr_accessor :name, :number, :expiration, :cvc, :status

	def initialize(name, number, expiration, cvc, status)
		@name = name
		@number = number
		@expiration = expiration
		@cvc = cvc
		@status = status
	end

end

cards = []
CSV.foreach("credit_cards.csv") do |row|
	cards << CreditCard.new(row[0], row[1], row[2], row[3], row[4])
end

# test
cards.each do |card|
   puts "#{card.name} responds to:"
   puts "\tName: #{card.respond_to?(:name) == true}"
   puts "\tNumber: #{card.respond_to?(:number) == true}"
   puts "\tExpiration: #{card.respond_to?(:expiration) == true}"
   puts "\tcvc: #{card.respond_to?(:cvc) == true}"
   puts "\tGet status: #{card.respond_to?(:status) == true}"
   puts "\tSet status: #{card.respond_to?(:status=) == true}"
   puts "\n\n"
end

#método para mostrar datos de tarjetas
def show_cards(cards)
	puts "|     name     |     number     |    expiration  |      cvc      |           status          |"
	puts "----------------------------------------------------------------------------------------------"
	cards.each do |card|
		space = 11 - card.name.length
		spaces = " " * space
		puts "|   #{card.name}#{spaces}|    #{card.number}  |      #{card.expiration}     |      #{card.cvc}     | #{card.status} |"
	end
end

show_cards(cards)