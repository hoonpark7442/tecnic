class AuthenticationController < ApplicationController

  ## JWT 토큰 생성을 위한 Devise 유저 정보 검증
  def authenticate_user
    ## body로 부터 받은 json 형식의 params를 parsing
    json_params = JSON.parse(request.body.read)
	  
    user = User.find_for_database_authentication(email: json_params["auth"]["email"])
    if user.valid_password?(json_params["auth"]["password"])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  ## Response으로서 보여줄 json 내용 생성 및 JWT Token 생성
  def payload(user)
	## 해당 코드 예제에서 토큰 만료기간은 '30일' 로 설정
	@token = JWT.encode({ user_id: user.id, exp: 30.days.from_now.to_i }, Rails.application.credentials.devise[:jwt_secret_key])	
	@tree = { :"JWT token" => @token, :userInfo => {id: user.id, email: user.email} } 
	 
	return @tree
  end
  
end