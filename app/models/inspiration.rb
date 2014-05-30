class Inspiration < ActiveRecord::Base
  has_many :videos

  def display_name
    display_text
  end
end
