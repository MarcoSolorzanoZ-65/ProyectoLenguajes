class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # Agrega aquí cualquier lógica adicional o recuperación de datos que necesites para la acción show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end

  def index
    @users = User.all
    if params[:search].present?
      @user = User.find_by(email: params[:search])
      if @user
        redirect_to user_path(@user)
      else
        flash.now[:notice] = t('errors.messages.user_not_found')
      end
    end
  end
  
  

  private

  
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :address, :category_id)
  end
end


  