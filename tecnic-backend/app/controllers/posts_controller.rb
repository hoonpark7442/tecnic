class PostsController < ApplicationController
  before_action :set_post, only: :show

  def index
    @posts = Post.all

    render json: @posts, status: :ok
  end

  def show
    render json: @post, status: :ok
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

end
