class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ update destroy show edit]

    def index
      @articles = Article.all
    end
    def new
      @article = Article.new
    end
    def show
      @article = Article.find(params[:id])
    end
  
    def edit
      @article = Article.find params[:id]
    end
  
    def create
      @article = Article.new(article_params)
  
      respond_to do |format|
        if @article.save
          format.html { redirect_to article_url(@article), notice: "article was successfully created." }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
    def  update
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to article_url(@article), notice: "article was successfully updated." }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  
  

      def destroy
        @article = Article.find(params[:id])
        if @article.present?
          @article.destroy
        end
        redirect_to articles_url
    end
    
  private
  
      def article_params
        params.require(:article).permit( :title, :body)
      end
      def set_article
        @article = Article.find(params[:id])
      end
end
