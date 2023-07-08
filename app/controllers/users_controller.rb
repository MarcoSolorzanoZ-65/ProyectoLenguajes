class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]

  def index
    if params[:search].present?
      @user = User.find_by(email: params[:search])
      if @user
        redirect_to user_path(@user)
        return
      else
        flash.now[:notice] = t('errors.messages.user_not_found')
      end
    end

    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users, each_serializer: UserIndexSerializer }
    end
  end


  def show
    @user = User.find(params[:id])
    # Add any additional logic or data retrieval you need for the show action
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

  def search
    if params[:search].present?
      @user = User.find_by(email: params[:search])
      if @user
        redirect_to user_path(@user)
      else
        flash.now[:notice] = t('errors.messages.user_not_found')
      end
    end
    @users = User.all
    render :index
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :address, :category_id, :status, :name)
  end
end
