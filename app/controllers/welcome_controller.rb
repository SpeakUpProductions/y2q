class WelcomeController < ApplicationController
  expose(:heartbreaks) { Heartbreak.all }
  expose(:inspirations) { Inspiration.all }
  expose(:video_played) { cookies[:video_played] }

  def played
    cookies[:video_played] = true
  end
end
