class WelcomeController < ApplicationController
  def index
    @heartbreaks = Heartbreak.all
    @inspirations = Inspiration.all
  end
end
