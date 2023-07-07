class Users::SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_action :verify_authenticity_token
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  
  # DELETE /resource/sign_out
  def create
    category = Category.find(3) # Cambia el 1 por el ID de la categoría que desees
    user = category.users.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      token = generate_token(user)
      render json: { token: token, user: user.as_json(include: :category) }
    else
      render json: { error: 'Credenciales inválidas' }, status: :unauthorized
    end
  end

  def destroy
    super do
      redirect_to new_user_session_path, notice: t('devise.sessions.user.signed_out')
      return
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def generate_token(user)
    payload = { sub: user.id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
  
  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "Logged out successfully."
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end  