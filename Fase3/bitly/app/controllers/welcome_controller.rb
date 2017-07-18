class WelcomeController < ApplicationController
	def home
		@urls = Url.all
		render 'index'
	end
end
