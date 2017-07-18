Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root "welcome#home"
	# Crea todas las rutas del recurso urls
	# resources :urls  
	post '/urls/new', to: 'urls#create'
  get '/urls/:url/short', to: 'urls#url', as: 'large_url'
  get '/:url', to: 'urls#extra', as: 'extra_url'
	# Ruta personalizada
	# match 'bit.ly/:url', to: 'urls#url', via: 'get', as: 'real_url'
end
