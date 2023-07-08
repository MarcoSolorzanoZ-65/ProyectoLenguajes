class AddOrderNameToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :order_name, :string
  end
end
