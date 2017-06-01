class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to articles_path, notice:"文章已经成功发布！"
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if  @article.update(article_params)
      redirect_to articles_path, notice:"文章更新成功！"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to article_path, alert:"文章已经删除！"
  end

  private

  def article_params
    params.require(:article).permit(:title,:description,:image)
  end

end

