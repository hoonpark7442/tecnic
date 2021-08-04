class SubscriptionsController < ApplicationController
  before_action :jwt_authenticate_request!

  def create
    @author = Author.find(subscription_params[:author_id])
    begin
      current_user.authors << @author
      render json: @author, status: :ok
    rescue => e
      render json: {
          message: e.message
        }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      @subscription = current_user.subscriptions.find_by!(author_id: params[:id])
      @subscription.destroy!
      head :no_content
    rescue ActiveRecord::RecordNotFound => e
      render json: {
          message: e.message,
          status: 404
        }, status: :not_found
    rescue => e
      render json: {
          message: e.message
        }, status: :unprocessable_entity
    end
  end

  private

  def subscription_params
    params.require(:data).permit(:author_id)
  end
end
