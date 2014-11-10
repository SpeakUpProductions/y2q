class DevelopersController < ApplicationController
  expose(:developer) { Developer.new(developer_params) }
  expose(:message)

  def new
  end

  def create
    unless developer.save
      render :new
    end
  end

  private
  def developer_params
    params.fetch(:developer, {}).permit(:name,:email,:comments)
  end
end
