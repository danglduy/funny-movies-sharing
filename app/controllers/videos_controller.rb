class VideosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.new(video_params)

    if @video.valid?
      begin
        video_info = VideoInfo.new(video_params[:video_url])
      rescue StandardError => e
        flash[:error] = e.message
        return render :new, status: 422
      end

      video_attibutes = {}

      video_info.tap do |v|
        video_attibutes[:video_url] = v.url
        video_attibutes[:title] = v.title
        video_attibutes[:description] = v.description
        video_attibutes[:embed_code] = v.embed_code
      end

      if @video.update(video_attibutes)
        # MARK: currently videos list is displayed on home page
        redirect_to root_url
      else
        flash[:error] = @video.errors.full_messages.join("\n")
        render :new, status: 422
      end
    else
      flash[:error] = @video.errors.full_messages.join("\n")
      render :new, status: 422
    end
  end

  private

  def video_params
    params.require(:video).permit(:video_url)
  end
end
