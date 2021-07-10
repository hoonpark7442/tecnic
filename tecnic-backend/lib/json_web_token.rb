class JsonWebToken
  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key])[0])
  rescue
    nil
  end
end