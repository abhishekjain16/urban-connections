class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total, :sub_total, :visitCharges, :tax, :created_at
  has_many :order_items
  belongs_to :address
end
