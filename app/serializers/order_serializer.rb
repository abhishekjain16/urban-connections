class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total, :sub_total, :visitCharges, :tax, :created_at, :order_number, :status, :staff_id
  has_many :order_items
  belongs_to :address
  belongs_to :customer
  belongs_to :staff
end
