class ProfilesController < ApplicationController
  before_action :authenticate_user!
  expose(:videos) { current_user.videos }
  expose(:profile) { current_user.profile }

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
