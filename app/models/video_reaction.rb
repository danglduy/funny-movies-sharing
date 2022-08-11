class VideoReaction < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :video
  belongs_to :user

  enum reaction_type: { up: 0, down: 1 }

  after_commit :update_video_reactions_summary, on: [:create, :destroy]

  private

  def update_video_reactions_summary
    broadcast_update_to "videos",
                         target: "#{dom_id(video)}_reactions_summary",
                         partial: "videos/video_reactions_summary",
                         locals: { video: video }
  end
end
