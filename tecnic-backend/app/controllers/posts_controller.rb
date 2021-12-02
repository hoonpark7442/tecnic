class PostsController < ApplicationController
  before_action :set_post, only: :show

  def index
    @posts = Post.all.includes([:posts_tags, :tags, :author])
    # params[:favorited] 는 유저다. 
    @posts = @posts.favorited_by(params[:favorited]) if params[:favorited].present?

    render json: @posts, status: :ok
  end

  def show
    # @current_user = User.find(auth_token[:user_id])
    puts "@@@"
    # p auth_token
    # p @current_user
    puts "@@@"
    render json: @post, include: :author, status: :ok
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

end
