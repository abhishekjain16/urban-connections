class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :total, default: 0.0, scale: 2, precision: 10
      t.references :business
      t.references :address
      t.float :visitCharges, default: 0.0, scale: 2, precision: 10
      t.float :tax, default: 0.0, scale: 2, precision: 10
      t.string :status
      t.float :sub_total, default: 0.0, scale: 2, precision: 10
      t.references :customer
      t.timestamps
    end
  end
end
