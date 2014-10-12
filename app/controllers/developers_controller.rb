class DevelopersController < ApplicationController
  expose(:developer) 
  expose(:message) 
  def new
    self.developer = Developer.new
  end
  def create
    developer = Developer.new(developer_params)
    if developer.save
      self.message = "Thank you for registering as a developer"
    else
      render :new
    end
  end
  def developer_params
    params.require(:developer).permit(:name,:email)
  end
end
