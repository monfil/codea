get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @url_input = params[:input]
  @urls = Url.all
  erb :index
end