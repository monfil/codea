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

#Cinco instancias de CreditCard
amex = CreditCard.new("Amex", 2345673444, "12/15", 2345, [234, 567, 456, 567, 344])
scotiabank = CreditCard.new("Scotiabank", 2345673744, "12/16", 2845, [234, 345, 456, 567, 344])
bancomer = CreditCard.new("Bancomer", 2345673444, "12/15", 2645, [234, 345, 456, 567, 344])
serfin = CreditCard.new("Serfin", 2345473454, "12/20", 1345, [234, 345, 456, 567, 344])
bancoppel = CreditCard.new("Bancoppel", 2345373464, "12/18", 2445, [567, 345, 456, 567, 344])

cards = [amex, scotiabank, bancomer, serfin, bancoppel]

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
	puts "-" * 94
	puts "|     name     |     number     |    expiration  |      cvc      |           status          |"
	puts "-" * 94
	cards.each do |card|
		space = 11 - card.name.length
		spaces = " " * space
		puts "|   #{card.name}#{spaces}|    #{card.number}  |      #{card.expiration}     |      #{card.cvc}     | #{card.status} |"
	end
	puts "-" * 94
end

show_cards(cards)