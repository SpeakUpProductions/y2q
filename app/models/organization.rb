class Organization < ActiveRecord::Base
  enum org_type: [ :time, :treasure, :campaign ]

  belongs_to :profile
  validates :profile_id, presence: true

  def website=(new_website)
    write_attribute(:website, extract_url(new_website))
  end

  private
  def extract_url(url)
    matches = url_expression.match(url)
    matches.blank? ? "" : matches[:address_no_protocol]
  end

  def url_expression
    /^((http:|https:|)\/\/|)(?<address_no_protocol>.+)/i
  end
end
