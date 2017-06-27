get '/url/:id' do
  p "*" * 40
  current_url = Url.increment(params[:id])
  redirect to (current_url.long_url)
end

post '/url' do
  url_input = params[:url]
  if session[:id]
    new_short_url = Url.create(user_id: session[:id], long_url: url_input)
    redirect to("/user_profile")
  else
   default_user = User.find(1)
   new_short_url = Url.create(user_id: default_user.id, long_url: url_input)
   redirect to ("/?input=1")
  end
end