module Api
  class MenusController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_menu, only: [:show, :edit, :update, :destroy]

    def index
      @menus = Menu.all
      render json: @menus, include: :products
    end

    def show
      render json: @menu, include: :products
    end

    def new
      @menu = Menu.new
    end

    def edit
    end

    def create
      @menu = Menu.new(menu_params)

      if @menu.save
        render json: @menu, status: :created
      else
        render json: @menu.errors, status: :unprocessable_entity
      end
    end

    def update
      if @menu.update(menu_params)
        render json: @menu, status: :ok
      else
        render json: @menu.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @menu.destroy
      head :ok
    end

    private

    def set_menu
      @menu = Menu.includes(:products).find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:name, products_attributes: [:name, :desc, :price, :status])
    end    
  end
end



