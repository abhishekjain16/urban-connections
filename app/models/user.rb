class User < ApplicationRecord
  has_secure_password
  has_secure_token :access_token

  validates :first_name, :last_name, presence: true
  validates :email, :username, presence: true

  scope :active, -> { where(status: true) }


  def owner?
    type == "Owner"
  end

  def customer?
    type == "Customer"
  end

  def staff?
    type == "Staff"
  end

  def admin?
    type == "Admin"
  end
end
