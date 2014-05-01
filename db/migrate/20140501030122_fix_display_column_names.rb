class FixDisplayColumnNames < ActiveRecord::Migration
  def change
    rename_column :heartbreaks, :display, :display_text
    rename_column :inspirations, :display, :display_text
  end
end
