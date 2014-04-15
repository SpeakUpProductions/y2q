class VideosController < ApplicationController
  def index
	@heartbreaks = Heartbreak.all
	@inspirations = Inspiration.all
  end

  def new
    if !user_signed_in? 
	  redirect_to new_user_session_path
    end
    
    @video = Video.new
	@heartbreaks = Heartbreak.all
	@inspirations = Inspiration.all
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
    params.require(:video).permit(:title, :embed_url, :heartbreak_id, :inspiration_id)
  end
end
