class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def indexh
    @articles = Article.all
  end
end
