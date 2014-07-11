class Organization < ActiveRecord::Base
  enum org_type: [ :time, :treasure, :campaign ]

  belongs_to :profile
  validates :profile_id, presence: true
end
