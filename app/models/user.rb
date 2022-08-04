class User < ApplicationRecord
  has_secure_password
  has_many :videos
  has_many :video_reactions

  validates :email, presence: true
end
