get '/tag/:id' do
	tag_id = params[:id]
	tag = Tag.find(tag_id)
	p "*" * 140
	p @posts_tag = tag.posts
	erb :posts_tag
end