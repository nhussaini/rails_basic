class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
   @article   = Article.find(params[:id])
  end
  
  def new
    @article = Article.new #otherwise @article would be nil in our view, and calling @article.errors.any? would throw an error.
  end

  def edit
    @article = Article.find(params[:id])
  end

  
  # def create
  #   @article = Article.new(params[:article])
   
  #   @article.save
  #   redirect_to @article
  # end

  # def create
  #   @article = Article.new(article_params)
   
  #   @article.save
  #   redirect_to @article
  # end

  def create
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
   
  private
    def article_params
      params.require(:article).permit(:title, :text)
  end

end
