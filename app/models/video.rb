class Video < ApplicationRecord
  belongs_to :user

  validates :video_url, presence: true
end
