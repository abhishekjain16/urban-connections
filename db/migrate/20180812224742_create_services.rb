class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.references :business
      t.string :name
      t.float :price, default: 0.0, scale: 2, precision: 10
      t.string :duration
      t.string :description
      t.timestamps
    end
  end
end
