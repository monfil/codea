get '/post/:id' do
	@post = Post.find(params[:id])
	erb :post
end

get '/edit_post/:id' do
	@post = Post.find(params[:id])
	tags_post = @post.tags
	@tags_string = Tag.extract_tags(tags_post)
	erb :edit_post
end

get '/post_saved' do
	erb :post_saved
end

post '/new_post' do
	title = params[:title]
	body = params[:body]
	tags = params[:tags]
	tags_array = Tag.catch_tags(tags)
	new_tags_array = Tag.analyze_tags(tags_array)
	new_post = Post.create(title: title, body: body)
	if new_post
		PostTag.add_tags_to_the_post(new_post, new_tags_array)
		redirect to ('/post_saved')
	else
	end
end

post '/update_post/:id' do
	
end

post '/delete_post/:id' do
	post_id = params[:id]
	post = Post.find(post_id)
	p "+" * 90
	p tags = post.tags
	p "ELIMINANDO TAG " * 5
	p post.destroy
	p Tag.delete_tags(tags)
	erb :post_deleted
end