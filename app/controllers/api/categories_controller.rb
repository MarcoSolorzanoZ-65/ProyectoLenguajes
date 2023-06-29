module Api
  class CategoriesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
      @categories = Category.all
      render json: @categories, include: :users
    end

    def show
      render json: @category, include: :users
    end

    def new
      @category = Category.new
    end

    def edit
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        render json: @category, status: :created
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    def update
      if @category.update(category_params)
        render json: @category, status: :ok
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @category.destroy
      head :ok
    end

    private

    def set_category
      @category = Category.includes(:users).find(params[:id])
    end

    def category_params
      params.require(:category).permit(:category_name, users_attributes: [:email, :password, :password_confirmation])
    end
  end
end
