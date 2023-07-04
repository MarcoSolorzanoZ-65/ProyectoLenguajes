module Api
  class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_order, only: [:show, :edit, :update, :destroy]

    def index
      @orders = Order.all
      render json: @orders, include: :products
    end

    def show
      render json: @order, include: :products
    end

    def new
      @order = Order.new
    end

    def edit
    end

    def create
      @order = Order.new(order_params)

      if @order.save
        render json: @order, status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    def update
      if @order.update(order_params)
        render json: @order, status: :ok
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @order.destroy
      head :ok
    end

    private

    def set_order
      @order = Order.includes(:products).find(params[:id])
    end

    def order_params
      params.require(:order).permit(:order_status, products_attributes: [:name, :desc, :price, :status])
    end
  end
end

