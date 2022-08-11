class Video < ApplicationRecord
  belongs_to :user
  has_many :video_reactions

  validates :video_url, presence: true
end
