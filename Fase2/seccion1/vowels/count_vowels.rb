require 'sinatra'

def count_vowels(name)
  vowels = name.scan(/[aeoui]/).count
  "My name is #{name} and it has #{vowels} vowels."
end

get "/" do
  count_vowels("Fabiola")
end