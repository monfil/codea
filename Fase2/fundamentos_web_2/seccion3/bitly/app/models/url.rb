class Url < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  before_create :generate_short_url

  def generate_short_url
		keys = [*0..9, *'a'..'z', *'A'..'Z'].join
		short = ""
		4.times do
			letter = rand(62)
			short << keys[letter]
		end
		self.short_url = short
	end
end