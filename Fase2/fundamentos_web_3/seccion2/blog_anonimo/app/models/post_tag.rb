class PostTag < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :post
  belongs_to :tag

  def self.add_tags_to_the_post(post, tags)
  	tags.each do |tag|
  		post_tag_relation = PostTag.find_by(post_id: post.id, tag_id: tag.id)
  		PostTag.create(post_id: post.id, tag_id: tag.id) if post_tag_relation == nil
  	end
  end
  
end