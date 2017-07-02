class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates :title, :body, :presence => true
  validates :title, :body, :uniqueness => true
end
