class MembersController < ApplicationController
	before_action :jwt_authenticate_request!

	def test
    @dataJson = { :message => "[Test] Token 인증 되었습니다! :D", :user => current_user }
    render :json => @dataJson, :except => [:id, :created_at, :updated_at]
  end
  
end
