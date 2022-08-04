class User < ApplicationRecord
  has_secure_password
  has_many :videos

  validates :email, presence: true
end
