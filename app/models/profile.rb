class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :organizations
  validates :user_id, presence: true
end
