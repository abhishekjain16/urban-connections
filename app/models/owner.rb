class Owner < User
  has_many :businesses
  has_many :orders, through: :businesses
end
