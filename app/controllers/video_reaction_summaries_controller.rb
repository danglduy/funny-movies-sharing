class VideoReactionSummariesController < ApplicationController
  def index
    video = load_video

    if video.present?
      video_reactions = video.video_reactions.includes(:user)
      render json: {
        reacted_emails: {
          up: video_reactions.up.map { |video_reaction| video_reaction.user.email },
          down: video_reactions.down.map { |video_reaction| video_reaction.user.email }
        }
      }
    end
  end

  private

  def load_video
    Video.find_by(id: params[:video_id])
  end
end
