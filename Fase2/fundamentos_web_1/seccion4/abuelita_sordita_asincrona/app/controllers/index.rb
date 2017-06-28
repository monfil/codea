get '/' do
  @abuelita = params[:abuelita]
  
  erb :index
  # Visita app/views/index.erb
end

post '/abuelita' do
  @user_input = params[:user_input]
  p "*" * 50
  p @user_input
  p answer = grandma_answer(@user_input)
  if request.xhr?
    p "*" * 120 
    p @user_input
    answer
  else
    redirect to ("/?abuelita=#{answer}")
    # if @user_input == "BYE"
    #   redirect to ("/?abuelita=CHAU!")
    # elsif @user_input == @user_input.upcase
    #   redirect to("/?abuelita=NO, NO DESDE 1983")
    # else
    #   redirect to("/?abuelita=HUH?! NO TE ESCUHO, HIJO!")
    # end
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