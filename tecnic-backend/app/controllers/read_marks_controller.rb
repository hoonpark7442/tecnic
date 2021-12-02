class ReadMarksController < ApplicationController
	before_action :jwt_authenticate_request!
	def create
		begin
			@post = Post.find(params[:post_id])
			@post.mark_as_read! for: current_user
			render json: @post, status: :ok
		rescue ActiveRecord::RecordNotUnique, ActiveRecord::RecordInvalid
			# The object is explicitly marked as read, so there is nothing to do
		rescue => e
			puts "#{e}: #{e.message}\n" + e.backtrace.join("\n")
			render json: {
          message: e.message
        }, status: :unprocessable_entity
		end
	end

	def destroy
		# 읽은걸 취소할 필요가 있을까
	end

	private

  # def read_mark_params
  #   params.require(:data).permit(:post_id)
  # end
end
