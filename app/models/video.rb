class Video < ActiveRecord::Base
  belongs_to :heartbreak
  belongs_to :inspiration
  belongs_to :user
end
