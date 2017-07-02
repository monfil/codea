get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb

  @all_posts = Post.all

  erb :index
end