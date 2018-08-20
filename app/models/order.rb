class Order < ApplicationRecord
  has_many :order_items
  belongs_to :customer
  belongs_to :business, optional: true
  belongs_to :address, optional: true
  belongs_to :staff, optional: true

  has_secure_token :order_number

  def reject!
    self.update_attributes(status: "rejected")
  end
end
