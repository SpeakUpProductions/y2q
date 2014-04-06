class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def edit
    @profile = current_user.profile
  end

  def show
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_url, notice: 'Profile successfully updated.'
    end
  end

  private
    def set_profile
      @profile = Profile.find(current_user.profile.id)
    end
    def profile_params
      params.require(:profile).permit(:name, :location, :bio, :career)
    end
end
