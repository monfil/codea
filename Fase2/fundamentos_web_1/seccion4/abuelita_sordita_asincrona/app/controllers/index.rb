get '/' do
  @abuelita = params[:abuelita]
  
  erb :index
  # Visita app/views/index.erb
end

post '/abuelita' do
  @user_input = params[:user_input]
  answer = grandma_answer(@user_input)
  if request.xhr?
    answer
  else
    redirect to ("/?abuelita=#{answer}")
  end
end

def grandma_answer(input)
  if input == "BYE"
    "CHAU!"
  elsif input == input.upcase
    "NO, NO DESDE 1983"
  else
    "HUH?! NO TE ESCUHO, HIJO!"   
  end
end