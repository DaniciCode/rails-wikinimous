class ArticlesController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(task_params)
    @article.save
    redirect_to article_path(@article)
  end

  def update
    # @task = Task.find(params[:id])
    @article.update(task_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to article_path(@article)
  end

  def destroy
    # @task = Task.find(params[:id])
    @article.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to articles_path
  end

  private

  def task_params
    params.require(:article).permit(:title, :content)
  end

  def set_task
    @article = Article.find(params[:id])
  end

end
