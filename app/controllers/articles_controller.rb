class ArticlesController < ApplicationController

  def index         # GET /tasks
    @articles = Article.all
  end

  def show          # GET /tasks/:id
    @articles = Article.find(params[:id])
  end

  def new           # GET /tasks/new
    @article = Article.new
  end

  def create        # POST /tasks
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path(@article)
    else
      render :new
    end
  end

  def edit          # GET /tasks/:id/edit
    @article = Article.find(params[:id])
  end

  def update        # PATCH /tasks/:id
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to articles_path(@article)
  end

  def destroy       # DELETE /tasks/:id
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path(@article)
  end

  private

  def article_params
     params.require(:article).permit(:title, :content)

  end
end

