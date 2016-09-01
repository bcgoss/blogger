class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new ( article_params )
    if @article.save
      redirect_to article_path(@article)
    else
      flash.notice = "Article '#{@article.title}' could not be saved!"
      redirect_to new_article_path
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes( article_params)
      flash.notice = "Article '#{@article.title}' updated!"
      redirect_to article_path(@article)
    else
      redirect_to edit_article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' deleted!"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
