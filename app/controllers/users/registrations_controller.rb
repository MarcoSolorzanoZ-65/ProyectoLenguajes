class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :configure_sign_up_params, only: [:create]


  def create
    build_resource(sign_up_params)
    if resource.save
      # Registration success
      sign_up(resource_name, resource)
      token = generate_token(resource)
      respond_to do |format|
        format.html { redirect_to after_sign_up_path_for(resource) }
        format.json { render json: { token:, user: resource.as_json(include: :category) } }
      end
    else
      # Registration failed
      errors = resource.errors.full_messages.join(', ')
      respond_to do |format|
        format.html { redirect_to new_user_registration_path, alert: errors }
        format.json { render json: { error: errors }, status: :unprocessable_entity }
      end
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :category_id, :address, :name])
  end

  def after_sign_up_path_for(_resource)
    respond_to do |format|
      format.html { root_path } # Redirect to root path for HTML format (Rails)
      format.json { { success: true }.to_json } # Return success JSON response for JSON format (Ionic)
    end
  end

  def generate_token(user)
    payload = { sub: user.id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
