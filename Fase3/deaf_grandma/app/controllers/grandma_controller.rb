class GrandmaController < ApplicationController
	def index
	end

	def respond
		p "*" * 30
		p @user_input = params[:user_input]

		if @user_input == "BYE"
   		@grandma_answer = "CHAU!"
  	elsif @user_input == @user_input.upcase
    	@grandma_answer = "NO, NO DESDE 1983"
  	else
    	@grandma_answer = "HUH?! NO TE ESCUHO, HIJO!"   
		end

		render 'index'
		
	end

end
