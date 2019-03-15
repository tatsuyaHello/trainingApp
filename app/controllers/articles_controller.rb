class ArticlesController < ApplicationController
  before_action :authenticate_user!, {only: [:new, :create, :edit, :update, :destroy]}
  before_action :article_find, {only: [:show, :edit, :destroy, :update]}
  before_action :user_find, {only: [:show, :edit, :destroy, :update]}

  def index 
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to root_path
    flash[:notice] = "You created article."
  end

  def show
    
  end

  def edit
    flash[:notice] = "You edited article."
  end

  def update
    flash[:notice] = "You updated article."
  end

  def destroy
    flash[:notice] = "You destroyed article."
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :user_id)
    end

    def article_find
      @article = Article.find(params[:id])
    end

    def user_find
      @user = User.find_by(id: @article.user_id)
    end
end
