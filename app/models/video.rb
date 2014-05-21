class Video < ActiveRecord::Base
  belongs_to :heartbreak
  belongs_to :inspiration
  has_one :user
end
