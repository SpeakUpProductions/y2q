class WelcomeController < ApplicationController
  expose(:heartbreaks) { Heartbreak.all }
  expose(:inspirations) { Inspiration.all }
end
