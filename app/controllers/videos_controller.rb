class VideosController < ApplicationController
  def index
  end

  def new
    if !user_signed_in? 
	  redirect_to new_user_session_path
    end
    
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
