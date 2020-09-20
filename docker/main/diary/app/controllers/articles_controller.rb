class ArticlesController < ApplicationController
  before_action :need_login, except: [:index, :show]
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new
    @article.user = @current_user
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.save!
    redirect_to article_url(@article.id)
  end
  def show
    begin
      @article = Article.find(params[:id])
    rescue
      redirect_to action: 'index'
      return
    end
  end
  def edit
    begin
      @article = Article.find(params[:id])
    rescue
      redirect_to action: 'index'
      return
    end
    unless @article.user_id == @current_user.id
      redirect_to action: 'show', id: @article.id
      return
    end
  end
  def update
    begin
      @article = Article.find(params[:id])
    rescue
      redirect_to action: 'index'
      return
    end
    unless @article.user_id == @current_user.id
      redirect_to action: 'show', id: @article.id
      return
    end
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.save!
    redirect_to article_url(@article.id)
  end
  def destroy
    begin
      @article = Article.find(params[:id])
    rescue
      redirect_to action: 'index'
      return
    end
    unless @article.user_id == @current_user.id
      redirect_to action: 'show', id: @article.id
      return
    end
    @article.destroy!
    redirect_to action: 'index'
  end
  private
  def need_login
    redirect_to action: 'index' unless @current_user
  end
end
