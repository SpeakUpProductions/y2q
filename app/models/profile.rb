class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :organizations
  has_many :issues, autosave: true
  has_many :talents, autosave: true
  validates :user_id, presence: true

  accepts_nested_attributes_for :organizations, allow_destroy: true

  def issue_tokens=(new_tokens)
    replace_tokens issues, new_tokens
  end

  def issue_tokens
    issues.map(&:display_text)
  end

  def talent_tokens=(new_tokens)
    replace_tokens talents, new_tokens
  end

  def talent_tokens
    talents.map(&:display_text)
  end

  private
  def replace_tokens(collection, new_values)
    collection.each{|token| token.mark_for_destruction }
    new_values.split(",").each{ |token| collection.build(display_text: token) }
  end
end
