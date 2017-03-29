def converter_pig_latin_word(word)
  # puts "Dame una palabra: "
  # word = gets.chomp
  if word[0].downcase =~ /[aeiou]/
    word + 'way'
  else
    if word[1] =~ /[aeiou]/
      consonant = word[0]
    else
      consonant = word[0,2]
    end
    word.gsub!(consonant,"")
    consonant =~ /[A-Z]/ ?  word.capitalize + consonant.downcase + "ay" : word + consonant.downcase + "ay"
  end
end

def converter_pig_latin_sentence(sentence)
  not_alowed = ['[', ']', ',', '"']
  not_alowed.each {|sym| sentence.delete!(sym)}
  new_array = []
  sentence.split.each {|word| new_array << converter_pig_latin_word(word)}
  new_array.map!{|item| item.to_s}.join(" ")
end

# puts ARGV.inspect
puts converter_pig_latin_sentence(ARGV.inspect)
# p converter_pig_latin_word("Papaya")
# p converter_pig_latin_word("Alfajor")
# p converter_pig_latin_word("Chancla")

# p converter_pig_latin_sentence("You don't know me")
# p converter_pig_latin_sentence("I have a pen I have an apple")
# p converter_pig_latin_sentence("Chichinflas y malafachas")