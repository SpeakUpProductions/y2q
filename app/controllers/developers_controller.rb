class DevelopersController < ApplicationController
  expose(:developer) 
  def new
    self.developer = Developer.new
  end
  def create
  end
end
