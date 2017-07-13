class ArticlesController < ApplicationController

	http_basic_authenticate_with name: 'dhh', password: "secret", except: [:index, :show]

	# Manda todos los artículos a la vista que los lista
	def index
		@articles = Article.all
	end
	# Se busca al artículo por su id, que viene en params[:id] que se obtuvo en el
	# request. El objeto se guarda en una vairable de instancia para poder pasarla
	# a la vista.
	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		# render plain: params[:article].inspect
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end

	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path		
	end
	
	# Se genera un método privado para indicar cuáles son los parámetros permitidos
	# por cuestiones de seguridad para prevenir uso malicioso de éstos y asegurarse 
	# de que éste método sólo podrá llamarse dentro de la clase
	# "Strong parameters"
	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
