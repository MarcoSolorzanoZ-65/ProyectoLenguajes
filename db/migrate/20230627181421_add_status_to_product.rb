class AddStatusToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :status, :boolean
  end
end
