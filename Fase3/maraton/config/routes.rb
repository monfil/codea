Rails.application.routes.draw do

  get 'maraton/index'
  
  root 'maraton#index'

  # resources :cards, :decks, :games, :game_answers, :options, :users
  resources :users
  
  get '/login', to: 'users#login', as: 'login'

  post '/login', to: 'users#user_authenticate', as: 'authenticate'

  get '/settings', to: 'games#settings', as: 'settings'

  get '/games/show', to: 'games#show', as: 'deck_show'

  get '/deck/:deck_id', to: 'games#create', as: 'new_game'

  get '/cards/:game', to: 'cards#get_cards', as: 'game_cards'

  post '/score/:game', to: 'games#score', as: 'score'

  get '/score/:game/results', to: 'games#results', as: 'results'

  get '/logout', to: 'users#logout', as: 'logout'

end