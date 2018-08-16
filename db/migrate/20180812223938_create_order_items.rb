class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order
      t.string :name
      t.float :price, default: 0.0, scale: 2, precision: 10
      t.integer :quantity
      t.string :instructions
      t.references :service
      t.timestamps
    end
  end
end
