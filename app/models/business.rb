class Business < ApplicationRecord
  validates :name, presence: true

  belongs_to :owner
  has_many :orders
  has_many :services
end
