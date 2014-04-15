class AddLookupsToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :heartbreak_id, :integer, references: :heartbreaks
    add_column :videos, :inspiration_id, :integer, references: :inspirations
  end
end
