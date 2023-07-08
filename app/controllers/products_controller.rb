class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    @orders = Order.all
    
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @orders = @orders.where("DATE(created_at) >= ? AND DATE(created_at) <= ?", start_date, end_date)
    end

    if params[:order_name].present?
      @orders = @orders.where("order_name LIKE ?", "%#{params[:order_name]}%")
    end

    if params[:status].present?
      @orders = @orders.where(order_status: params[:status])
    end
    
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: t('application.created') }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: t('application.edited') }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: t('application.destroyed') }
      format.json { head :no_content }
    end
  end

  def update_status
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to orders_path, notice: 'El estado de la orden ha sido actualizado exitosamente.'
    else
      render :edit_status
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :desc, :image, :price, :status, :total_sales, :order_id, :menu_id)
  end

  def order_params
    params.require(:order).permit(:order_status)
  end
end


