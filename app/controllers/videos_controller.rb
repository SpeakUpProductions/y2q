class VideosController < ApplicationController
  include VideosHelper
  before_action :authenticate_user!, :only => [:new, :create]

  def filtered
    heartbreak_ids = filter_params[:heartbreak_ids] || {}
    inspiration_ids = filter_params[:inspiration_ids] || {}
    heartbreak_ids.map!(&:to_i)
    inspiration_ids.map!(&:to_i)

    if heartbreak_ids.blank? && inspiration_ids.blank?
      @videos = Video.all
    else
      @videos = Video.select{|v| heartbreak_ids.include?(v.heartbreak_id) || inspiration_ids.include?(v.inspiration_id)}
    end
    @hb_filter = heartbreak_ids
    @i_filter = inspiration_ids
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
    params.permit(:heartbreak_ids => [], :inspiration_ids => [])
  end
  def video_params
    params.require(:video).permit(:title, :embed_url, :heartbreak_id, :inspiration_id)
  end
end
