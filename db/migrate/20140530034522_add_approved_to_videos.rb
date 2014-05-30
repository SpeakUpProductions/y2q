class AddApprovedToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :approved, :boolean
  end
end
