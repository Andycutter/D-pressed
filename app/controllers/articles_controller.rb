class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.persisted?
      redirect_to root_path, notice: 'Article successfully created.'
    else
      flash[:error] = "Fields can't be blank. Your article could not be saved"
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
