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
    render :show, layout:false
  end

  def edit
    @video = Video.find(params[:id])
    @heartbreaks = Heartbreak.all
    @inspirations = Inspiration.all
    render :edit, layout:false
  end

  def update
     @video = Video.find(params[:id])
     @video.update(video_params)
     head :ok
  end

  def index
    @hb_filter = heartbreak_ids
    @i_filter = inspiration_ids

    @heartbreaks = Heartbreak.all.map { |h| {id: h.id, display_text: h.display_text, checked: @hb_filter.include?(h.id) } }
    @inspirations = Inspiration.all.map { |i| {id: i.id, display_text: i.display_text, checked: @i_filter.include?(i.id) } }

    if @hb_filter.blank? && @i_filter.blank?
      @videos = approved_videos
    else
      @videos = approved_videos.select{|v| @hb_filter.include?(v.heartbreak_id) || @i_filter.include?(v.inspiration_id)}
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
    selected_hb.map(&:to_i)
  end

  def inspiration_ids
    selected_i.map(&:to_i)
  end

  def selected_hb
    Array(filter_params[:hb])
  end

  def selected_i
    Array(filter_params[:i])
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
