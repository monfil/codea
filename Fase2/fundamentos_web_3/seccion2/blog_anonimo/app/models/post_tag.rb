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

  def self.update_tags(post, old_tags, new_tags)
  	tags_to_drop = old_tags - new_tags
  	tags_to_drop.each do |tag|
  		post_tag = PostTag.find_by(post_id: post.id, tag_id: tag.id)
  		post_tag.destroy
  	end
  	all_tags = old_tags + new_tags
  	new_tags = all_tags.uniq
  end
  
end