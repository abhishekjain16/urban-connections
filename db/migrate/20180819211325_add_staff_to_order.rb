class AddStaffToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :staff_id, :integer
    add_column :orders, :order_number, :string
    add_column :businesses, :yelp_id, :string
  end
end
