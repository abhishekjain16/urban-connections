class Order < ApplicationRecord
  has_many :order_items
  belongs_to :customer
  belongs_to :business

  def reject!
    self.update_attributes(status: "rejected")
  end
end
