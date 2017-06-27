default_user = User.create(name: "default", email: "default@mail.com", password: "123")
# user1 = User.create(name: "Mew", email: "mew@mail.com", password: "123")
# user2 = User.create(name: "Trobin", email: "trobin@mail.com", password: "123")

# def generate_short_url
# 	keys = [*0..9, *'a'..'z', *'A'..'Z'].join
# 	short = ""
# 	4.times do
# 		letter = rand(62)
# 		short << keys[letter]
# 	end
# 	short
# end

# Url.create(user_id: default_user.id, long_url: "www.locomotion.mx", short_url: generate_short_url)
# Url.create(user_id: user1.id, long_url: "guides.rubyonrails.org", short_url: generate_short_url)
# Url.create(user_id: user1.id, long_url: "https://stackoverflow.com", short_url: generate_short_url)
# Url.create(user_id: user2.id, long_url: "https://www.reddit.com/r/gifs/", short_url: generate_short_url)