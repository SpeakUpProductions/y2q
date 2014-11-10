class DevelopersController < ApplicationController
  expose(:developer) 
  expose(:message) 
  def new
    self.developer = Developer.new
  end
  def create
    developer = Developer.new(developer_params)
    if developer.save
      self.developer = developer
    else
      render :new
    end
  end
  def developer_params
    params.require(:developer).permit(:name,:email,:comments)
  end
end
