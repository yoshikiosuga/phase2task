class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def tweets
    @blogs = Blog.all
  end

  def index
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to tweets_blogs_path, notice:"ツイートを作成しました"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to tweets_blogs_path, notice:"ツイートを編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to tweets_blogs_path, notice:"ツイートを削除しました"
  end

  private
    def blog_params
      params.require(:blog).permit(:content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
