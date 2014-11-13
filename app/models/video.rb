class Video < ActiveRecord::Base
  belongs_to :heartbreak
  belongs_to :inspiration
  belongs_to :user

  def approve!
    update_attribute(:disapproved, false)
    update_attribute(:approved, true)
  end

  def disapprove!(reason)
    update_attributes({
      disapproved: true,
      disapproval_reason: reason,
      approved: false
    })
  end

  def self.unapproved
    where({ approved: false, disapproved: false} )
  end

  def self.approved
    where(approved: true)
  end

  def self.disapproved
    where(disapproved: true)
  end
end
