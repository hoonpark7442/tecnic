class AuthorsController < ApplicationController
  before_action :set_author, only: :show

  def index
    # @authors = Author.all
    
    page = params[:page].nil? ? nil : params[:page][:number]
    @authors = Author.all.paginate(page: page, per_page: 10)

    render json: @authors, status: :ok
  end

  def show
    render json: @author, status: :ok
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

end


# 구독자수 보여주기