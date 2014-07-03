class VideosController < ApplicationController
  include VideosHelper
  before_action :authenticate_user!, :only => [:new, :create]
  expose(:heartbreaks) { Heartbreak.all }
  expose(:inspirations) { Inspiration.all }
  expose(:hb_viewmodels) { checkbox_viewmodel(Heartbreak.all, hb_filter) }
  expose(:i_viewmodels) { checkbox_viewmodel(Inspiration.all, i_filter) }
  expose(:hb_filter) { heartbreak_ids }
  expose(:i_filter) { inspiration_ids }

  def filtered
    if hb_filter.blank? && i_filter.blank?
      @videos = approved_videos
    else
      @videos = approved_videos.select{|v| hb_filter.include?(v.heartbreak_id) || i_filter.include?(v.inspiration_id)}
    end
    render :filtered, layout:false
  end

  def show
    @video = Video.find(params[:id])
    render :show, layout:false
  end

  def edit
    @video = Video.find(params[:id])
    render :edit, layout:false
  end

  def update
     @video = Video.find(params[:id])
     @video.update(video_params)
     head :ok
  end

  def index
    if hb_filter.blank? && i_filter.blank?
      @videos = approved_videos
    else
      @videos = approved_videos.select{|v| hb_filter.include?(v.heartbreak_id) || i_filter.include?(v.inspiration_id)}
    end
  end

  def new
    @video = current_user.videos.new
  end

  def create
    @video = Video.new(video_params)
    @video.thumbnail_url = get_thumb_url(video_params[:embed_url])
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

  def checkbox_viewmodel(collection, filter)
    collection.map { |item| {id: item.id, display_text: item.display_text, checked: filter.include?(item.id) } }
  end
end
