class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :authenticate_if_viewing_private_route, only: :show
  expose(:videos) { get_videos }
  expose(:profile) { get_profile }
  expose(:viewing_own_profile)
  expose(:video_base_action) { viewing_own_profile ? edit_video_lambda : show_video_lambda }

  def update
    if profile.update(profile_params)
      redirect_to current_profile_url, notice: 'Profile successfully updated.'
    end
  end

  private

  def get_videos
    viewing_own_profile ? profile.user.videos : profile.user.videos.where(approved: true)
  end

  def get_profile
    viewing_own_profile ? current_user.profile : Profile.find(params[:id])
  end

  def authenticate_if_viewing_private_route
    authenticate_user! unless params[:id]
  end

  def viewing_own_profile
    viewing_private_route || signed_in_and_viewing_own_page_from_public_route
  end

  def signed_in_and_viewing_own_page_from_public_route
    (user_signed_in? && current_user.profile.id.to_s == params[:id])
  end

  def viewing_private_route
    !params[:id]
  end

  def profile_params
    params.require(:profile).permit(
      :name,
      :location,
      :bio,
      :career,
      :personality,
      :issue_tokens,
      :talent_tokens,
      organizations_attributes: [:id, :profile_id, :name, :website, :org_type, :_destroy])
  end

  def edit_video_lambda
    lambda { |id| edit_video_path(id) }
  end

  def show_video_lambda
    lambda { |id| video_path(id) }
  end
end
