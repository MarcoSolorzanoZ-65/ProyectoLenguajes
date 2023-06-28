class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.integer :price
      
      t.belongs_to :menu

      t.timestamps
    end
  end
end
