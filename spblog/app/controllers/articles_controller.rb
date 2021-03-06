class ArticlesController < ApplicationController
 
  # GET /articles
  # GET /articles.json
  def index
    if !session[:user_id]
       redirect_to '/login'
    end  
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    if !session[:user_id]
       redirect_to '/login'
    end  
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
   end


  def zip
    @fileId = params[:id]
    @downloads = Download.new(:article_id => @fileId, :user_id => session[:user_id]).save
    send_file Rails.root.join('private', 'fees.pdf'), :type=>"application/pdf", :x_sendfile=>true  
  end

  def doc
   @fileId = params[:id]
   @downloads = Download.new(:article_id => @fileId, :user_id => session[:user_id]).save
   send_file Rails.root.join('private', 'gowtham_resume.doc'), :type=>"application/doc", :x_sendfile=>true  
  end


  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to '/articles', notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :post, :user_id)
    end

   
end
