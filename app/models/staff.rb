class Staff < User
  has_many :orders
  belongs_to :business
end
