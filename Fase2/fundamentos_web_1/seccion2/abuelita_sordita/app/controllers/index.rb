get '/' do
  @abuelita = params[:abuelita]
  
  erb :index
  # Visita app/views/index.erb
end


post '/abuelita' do
  user_input = params[:user_input]
  if user_input == "BYE"
    redirect to ("/?abuelita=CHAU!")
  elsif user_input == user_input.upcase
    redirect to("/?abuelita=NO, NO DESDE 1983")
  else
    redirect to("/?abuelita=HUH?! NO TE ESCUHO, HIJO!")
  end
end

