get '/' do
  erb :index
end

get '/:new_word' do
	@new_word = params[:new_word]
  #generar la forma canonica de new_word
  palabra_canonical = @new_word.chomp.chars.sort(&:casecmp).join
  @anagrams = Word.where(canonical: palabra_canonical)
  @anagrams.count
  erb :word
end

post '/new_word' do
  redirect to ("/#{params[:user_word]}")
end