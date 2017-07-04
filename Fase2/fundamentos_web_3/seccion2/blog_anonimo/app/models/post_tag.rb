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
    # p "***TAGS VIEJAS" * 6
    # p old_tags
    # p "***TAGS NUEVAS" * 6
    # p new_tags
    # p "***TAGS A ELIMINAR" * 6
    delete_tags = old_tags - new_tags
    delete_tags.each do |tag|
      row = PostTag.find_by(post_id: post.id, tag_id: tag.id)
      row.destroy
    end
    # p "***TAGS DEFINITIVAS" * 6
    new_tags
  end
  
end