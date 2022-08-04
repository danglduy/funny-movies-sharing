class VideoReaction < ApplicationRecord
  belongs_to :video
  belongs_to :user

  enum reaction_type: { up: 0, down: 1 }
end
