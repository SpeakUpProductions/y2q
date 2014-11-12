class AddDisapprovedToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :disapproved, :boolean, null: false, default: false
  end
end
