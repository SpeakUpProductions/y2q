class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :organizations
  has_many :issues, autosave: true
  has_many :talents
  validates :user_id, presence: true

  accepts_nested_attributes_for :organizations, allow_destroy: true
  accepts_nested_attributes_for :issues, allow_destroy: true
  accepts_nested_attributes_for :talents, allow_destroy: true

  def issue_tokens=(new_issues)
    issues.each{|i| i.mark_for_destruction }
    new_issues.split(',').each{ |i| issues.build(display_text: i) }
  end

  def issue_tokens
    issues.map{|i| {name: i.display_text} }
  end
end
