class Developer < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :comments, presence: true, length: { maximum: 500 }
end
