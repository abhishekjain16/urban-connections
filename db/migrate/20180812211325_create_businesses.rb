class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|

      t.string :name
      t.float :minimum_order_charge, default: 0.0, scale: 2, precision: 10
      t.float :service_charge, default: 0.0, scale: 2, precision: 10
      t.string :website
      t.references :owner
      t.boolean :status, default: false
      t.timestamps
    end
  end
end
