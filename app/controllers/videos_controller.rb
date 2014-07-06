class VideosController < ApplicationController
  include VideosHelper
  before_action :authenticate_user!, :only => [:new, :create]
  expose(:videos) { get_videos }
  expose(:heartbreaks) { Heartbreak.all }
  expose(:inspirations) { Inspiration.all }
  expose(:hb_viewmodels) { checkbox_viewmodel(Heartbreak.all, hb_filter) }
  expose(:i_viewmodels) { checkbox_viewmodel(Inspiration.all, i_filter) }
  expose(:hb_filter) { heartbreak_ids }
  expose(:i_filter) { inspiration_ids }
  expose(:video) { find_or_instantiate_video }
  expose(:video_base_action) { show_video_lambda }

  def filtered
    render :filtered, layout:false
  end

  def show
    render :show, layout:false
  end

  def edit
    render :edit, layout:false
  end

  def new
    self.video = Video.new
  end

  def update
     video.update(video_params)
     head :ok
  end

  def current_user_index
    self.videos = current_user.videos
    self.video_base_action = edit_video_lambda
    render partial: "videos/filtered_videos", locals: { section_title: "My Videos" }, layout:false
  end

  def create
    video.thumbnail_url = get_thumb_url(video_params[:embed_url])
    if video.save
      redirect_to current_profile_path
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
    params.require(:video).permit(:user_id, :title, :embed_url, :heartbreak_id, :inspiration_id, :_destroy)
  end

  def approved_videos
    Video.where(approved: true)
  end

  def get_videos
    if hb_filter.blank? && i_filter.blank?
      approved_videos
    else
      approved_videos.select{|v| hb_filter.include?(v.heartbreak_id) || i_filter.include?(v.inspiration_id)}
    end
  end

  def checkbox_viewmodel(collection, filter)
    collection.map { |item| {id: item.id, display_text: item.display_text, checked: filter.include?(item.id) } }
  end

  def find_or_instantiate_video
    params[:id] ? Video.find(params[:id]) : current_user.videos.new(video_params)
  end

  def edit_video_lambda
    lambda { |id| edit_video_path(id) }
  end

  def show_video_lambda
    lambda { |id| video_path(id) }
  end
end
