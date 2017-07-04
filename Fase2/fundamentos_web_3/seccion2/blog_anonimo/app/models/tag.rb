class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :post_tags, dependent: :destroy
  has_many :posts, :through => :post_tags

  validates :tag, :presence => true
  validates :tag, :uniqueness => true

  def self.extract_tags(tags)
		tags_array = []
		tags_string = ""
		tags.each do |tag|
			tags_array << tag.tag
		end
		tags_array.each do |tag|
			tags_string << tag + ","
		end
		tags_string
	end

	def self.catch_tags(tags)
		tags_array = tags.split(',')
	end

	def self.analyze_tags(tags_array)
		new_tags_array = []
		tags_array.each do |tag|
			find_tag = Tag.find_by(tag: tag)
			if  find_tag == nil
				new_tags_array << Tag.create(tag: tag)
			else
				new_tags_array << find_tag
			end
		end
		new_tags_array
	end

end