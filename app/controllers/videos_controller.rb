class VideosController < ApplicationController
  include VideosHelper
  before_action :authenticate_user!, :only => [:new, :create]

  def filtered
    hb_ary = JSON.parse(filter_params[:heartbreaks])
    i_ary = JSON.parse(filter_params[:inspirations])
    @videos = Video.select{|v| hb_ary.include?(v.heartbreak_id) || i_ary.include?(v.inspiration_id)}
    @hb_filter = hb_ary
    @i_filter = i_ary
    render :filtered, layout:false
  end

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

  def filter_params
    params.permit(:heartbreaks,:inspirations)
  end
  def video_params
    params.require(:video).permit(:title, :embed_url, :heartbreak_id, :inspiration_id)
  end
end
