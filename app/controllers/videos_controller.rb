class VideosController < ApplicationController
  include VideosHelper
  before_action :authenticate_user!, :only => [:new, :create]

  def index
    @heartbreaks = Heartbreak.all
    @inspirations = Inspiration.all
    
    @videos = Video.all
  end

  def new
    @video = Video.new
    @heartbreaks = Heartbreak.all
    @inspirations = Inspiration.all
  end

  def create
    @video = Video.new(video_params)
    @video.thumbnail_url = get_thumb_url(video_params[:embed_url])
    @heartbreaks = Heartbreak.all
    @inspirations = Inspiration.all
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
