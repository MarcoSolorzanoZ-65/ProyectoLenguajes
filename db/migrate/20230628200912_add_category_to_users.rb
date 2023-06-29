class AddCategoryToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :category, null: false, foreign_key: true
  end
end
