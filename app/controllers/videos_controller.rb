class VideosController < ApplicationController
  include VideosHelper
  before_action :authenticate_user!, :only => [:new, :create]

  def filtered
    @hb_filter = heartbreak_ids
    @i_filter = inspiration_ids

    if @hb_filter.blank? && @i_filter.blank?
      @videos = approved_videos
    else
      @videos = approved_videos.select{|v| @hb_filter.include?(v.heartbreak_id) || @i_filter.include?(v.inspiration_id)}
    end
    render :filtered, layout:false
  end

  def show
    @video = Video.find(params[:id])
    @heartbreaks = Heartbreak.all
    @inspirations = Inspiration.all
    if (!current_user.nil? && current_user.id == @video.user_id)
      render :edit, layout:false    
    else
      render :show, layout:false
    end
  end

  def update
     render :edit, layout:false
  end

  def index
    @heartbreaks = Heartbreak.all
    @inspirations = Inspiration.all

    idlist = Struct.new(:id)
    @hb = idlist.new(heartbreak_ids())
    @i = idlist.new(inspiration_ids())
    
    @videos = approved_videos
    if @hb[:id].blank? && @i[:id].blank?
      @videos = approved_videos
    else
      @videos = approved_videos.select{|v| @hb[:id].include?(v.heartbreak_id) || @i[:id].include?(v.inspiration_id)}
    end
  end

  def new
    @video = current_user.videos.new
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

  private
  def heartbreak_ids
    [ (filter_params[:hb] || {:id => []} )  [:id] ].flatten.reject(&:empty?).map(&:to_i)
  end
  def inspiration_ids
    [ (filter_params[:i]  || {:id => []} )  [:id] ].flatten.reject(&:empty?).map(&:to_i)
  end

  def filter_params
    params.slice(:hb, :i)
  end

  def video_params
    params.require(:video).permit(:user_id, :title, :embed_url, :heartbreak_id, :inspiration_id)
  end

  def approved_videos
    Video.where(approved: true)
  end
end
