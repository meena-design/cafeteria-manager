class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  #validates :first_name, presence: true
  validates :email, { presence: true, uniqueness: true }

  def is_owner?
    role == "owner"
  end
end
