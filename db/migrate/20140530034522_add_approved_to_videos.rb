class AddApprovedToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :approved, :boolean, null: false, default: false
  end
end
