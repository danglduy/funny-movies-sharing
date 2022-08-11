class VideoReactionsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @video_reaction = VideoReaction.find_or_initialize_by(user: current_user, video_id: params[:video_id])

    if @video_reaction.new_record?
      @video_reaction.update!(reaction_type: params[:reaction_type])
    end
  end

  def destroy
    @video_reaction = VideoReaction.find_by(id: params[:id])
    @video_reaction.destroy if @video_reaction.present?
  end

  private

  def video_params
    params.require(:video).permit(:video_url)
  end
end
