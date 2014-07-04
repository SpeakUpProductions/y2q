class ProfilesController < ApplicationController
  before_action :authenticate_user!
  expose(:videos) { get_videos }
  expose(:profile) { get_profile }
  expose(:viewing_own_profile)

  def edit
  end

  def show
  end

  def update
    if profile.update(profile_params)
      redirect_to profile_url, notice: 'Profile successfully updated.'
    end
  end

  private
  def get_videos
    profile.user.videos
  end

  def get_profile
    Profile.find(profile_id)
  end

  def viewing_own_profile
    !params[:id] || current_user.profile.id.to_s == params[:id]
  end

  def profile_id
    params[:id] || current_user.profile.id
  end

  def profile_params
    params.require(:profile).permit(
      :name,
      :location,
      :bio,
      :career,
      :MBTI,
      organizations_attributes: [:id, :profile_id, :name, :website, :org_type, :_destroy],
      issues_attributes: [:id, :profile_id, :display_text, :_destroy])
  end
end
