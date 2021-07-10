class Users::RegistrationsController < Devise::RegistrationsController
	respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save
    render json: resource
  rescue => e
    logger.send(:fatal, "#{e}: #{e.message}\n#{e.backtrace.join("\n")}")
  	validation_error(e)
  end

end
