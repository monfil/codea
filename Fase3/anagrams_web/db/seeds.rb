# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def canonical_maker(word)
	word.downcase.chars.sort.join
end

File.open("words").each do |line|
	line.each_line do |word|
		canonical = canonical_maker(word.chomp)
		Word.create!(word: word.chomp, canonical: canonical)
	end
end