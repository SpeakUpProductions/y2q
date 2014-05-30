class Video < ActiveRecord::Base
  belongs_to :heartbreak
  belongs_to :inspiration
  belongs_to :user

  def approve!
    update_attribute(:approved, true)
  end

  def self.unapproved
    where(approved: false)
  end
end
