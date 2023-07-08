class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_status, :order_name
  has_many :products

  def products
    object.products.map do |product|
      {
        id: product.id,
        name: product.name,
        desc: product.desc,
        price: product.price,
        status: product.status,
        quantity: get_quantity(product.id)
      }
    end
  end

  private

  def get_quantity(product_id)
    order_product = object.order_products.find_by(product_id:)
    order_product.quantity if order_product
  end
end
