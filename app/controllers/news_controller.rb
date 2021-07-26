class NewsController < ApplicationController

  def index
    @news = News.all

    render json: @news
  end

  def show
    render json: @post
  end

  def create
    @post = News.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private
    def set_post
      @post = News.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :tags, :user_id)
    end
end
