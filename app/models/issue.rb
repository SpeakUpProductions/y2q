class Issue < ActiveRecord::Base
  belongs_to :profile
  validates :profile_id, presence: true
end
