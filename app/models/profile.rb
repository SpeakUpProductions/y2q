class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :organizations
  validates :user_id, presence: true

  accepts_nested_attributes_for :organizations, allow_destroy: true
end
