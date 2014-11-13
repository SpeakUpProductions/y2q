class AddDisapprovalReasonToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :disapproval_reason, :string
  end
end
