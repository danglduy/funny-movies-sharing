class VideoReactionSummariesController < ApplicationController
  def index
    video = load_video

    if video.present?
      render json: {
        reacted_emails: {
          up: video.video_reactions.up.map(&:user).pluck(:email),
          down: video.video_reactions.down.map(&:user).pluck(:email)
        }
      }
    end
  end

  private

  def load_video
    Video.includes(:video_reactions).find_by(id: params[:video_id])
  end
end
