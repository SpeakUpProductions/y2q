class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :organizations
  has_many :issues
  has_many :talents
  validates :user_id, presence: true

  accepts_nested_attributes_for :organizations, allow_destroy: true
  accepts_nested_attributes_for :issues, allow_destroy: true
  accepts_nested_attributes_for :talents, allow_destroy: true
end
