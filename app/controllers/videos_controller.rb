class VideosController < ApplicationController
  def index
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def video_params
    params.require(:video).permit(:title, :embed_url)
  end
end
