class Users::SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_action :verify_authenticity_token, only: :create

  def create
    user = User.find_by(email: params[:user][:email])

    if user&.valid_password?(params[:user][:password])
      sign_in(user)
      token = generate_token(user)

      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: { token: token, user: user.as_json(include: :category) } }
      end
    else
      respond_to do |format|
        format.html { redirect_to new_user_session_path, alert: 'Invalid email or password' }
        format.json { render json: { error: 'Invalid email or password' }, status: :unauthorized }
      end
    end
  end


  def destroy
    super do
      redirect_to new_user_session_path, notice: t('devise.sessions.user.signed_out')
      return
    end
  end

  protected

  def after_sign_in_path_for(resource)
    root_path
  end

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
