class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :post_tags, dependent: :destroy
  has_many :tags, :through => :post_tags

  validates :title, :body, :presence => true
  validates :title, :body, :uniqueness => true

  # after_destroy :destroy_tags

  # private

  # def destroy_tags
  # 	p "*" * 90
  # 	p "destruyendo tags"
  # 	p self.tags.destroy_all
  # end
end
