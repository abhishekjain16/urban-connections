class Customer < User
  has_many :orders
  has_many :addresses
end
