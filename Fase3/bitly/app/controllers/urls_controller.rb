class UrlsController < ApplicationController
	def create
		p "*** Params" * 4
		p url_params
		p @url = Url.new(url_params)
		if @url.save
		  redirect_to root_path
		else
			@message = "URL no creada"
		  @urls = Url.all
		  render :template => 'welcome/home'
		end
	end

	def url
		p "*** CLICK COUNT " * 4
  	p url = Url.find_by(short_url: params[:url])
  	p url.click_count += 1
  	p url.save
  	# complete_url = url.long_url
  	redirect_to '/'
  	# redirect_to extra_url_path(url.long_url) and return
  	# render :template => 'welcome/short'
	end

	def extra
		real_url = params[:url]

		redirect_to real_url
	end

	private

		def url_params
		  params.require(:url).permit(:long_url)
		end
end
