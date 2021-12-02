class FavoritesController < ApplicationController
  before_action :jwt_authenticate_request!
  before_action :find_post

  def create
    current_user.favorite(@post)

    render json: @post, serializer: PostSerializer, status: :ok
  end

  def destroy
    current_user.unfavorite(@post)

    render json: @post, serializer: PostSerializer, status: :ok
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
