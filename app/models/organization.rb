class Organization < ActiveRecord::Base
  enum org_type: [ :volunteer, :cause, :give, :campaign ]

  belongs_to :profile
  validates :profile_id, presence: true
end
