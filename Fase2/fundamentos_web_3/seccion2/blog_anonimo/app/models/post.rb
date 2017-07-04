class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :post_tags, dependent: :destroy
  has_many :tags, :through => :post_tags

  validates :title, :body, :presence => true
  validates :title, :body, :uniqueness => true

end
