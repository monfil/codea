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

get '/update_post' do
	erb :post_updated
end

get '/delete_tag/:id' do
	tag = Tag.find(params[:id])
	tag.destroy
	redirect to ('/')
end

get '/edit_tag/:id' do
	p "***Edit tag" * 6
	@tag = Tag.find(params[:id])
	erb :edit_tag
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
		# redirect to ('/post_saved')
		redirect to ('/')
	else
	end
end

post '/update_post/:id' do
	id = params[:id]
	post = Post.find(id)
	old_tags = post.tags
	title = params[:title]
	body = params[:body]
	tags = params[:tags]
	tags_array = Tag.catch_tags(tags)
	new_tags = Tag.analyze_tags(tags_array)
	search_post = Post.find_by(title: title)
	post = Post.find(id)
	post.update(body: body)
	up_tags = PostTag.update_tags(post, old_tags, new_tags)
	PostTag.add_tags_to_the_post(post, up_tags)
	redirect to ('/')
	# erb :post_updated
end

post '/delete_post/:id' do
	post_id = params[:id]
	post = Post.find(post_id)
	tags = post.tags
	post.destroy
	# erb :post_deleted
	redirect to ('/')
end

post '/edit_tag/:id' do
	p "****TAGS" * 8
	tag = Tag.find(params[:id])
	new_tag = params[:tag]
	p tag.update(tag: new_tag)
	p "Heloooooooooooo!"
	posts = tag.post_tags
	posts.destroy_all
	redirect to ('/')
end