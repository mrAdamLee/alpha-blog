class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def update

    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article has been successfully updated."
      redirect_to @article
    else 
      render :edit, status: 422
    end
  end

  def edit 
    @article = Article.find(params[:id])
  end

  def new 
    @article = Article.new #<--initiate an article with nothing in it so we can check for validation errors and flash them on view
  end

  def destroy
    #TODO: do this with a partial and turbolinks/streams, ie dont redirect the user.
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "Article deleted successfully"
      redirect_to articles_path
    end
  end

  def create 
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created succesfully."
      redirect_to @article #<--extracts id and redirects to articles/:id
    else 
      render :new, status: 422 #<-- turbo expecting redirect, cant have 200 and not reload, this makes it so we dont reload but gets status
    end

  end
end
