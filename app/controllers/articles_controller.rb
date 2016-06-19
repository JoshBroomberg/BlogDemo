class ArticlesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    respond_to do |format|
      format.html do 
        @articles = Article.all
      end

      format.json do
        articles = Article.all
        json_articles = articles.map{|article| article.json_format}
        render json: json_articles
      end
    end
  end

  def new
    @custom_value = params["cv"]
    @article = Article.new
  end

  def create
    Article.create(body: article_params["body"])
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:body)
  end
end
