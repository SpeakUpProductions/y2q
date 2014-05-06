class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :profile_id
      t.string :display_text
    end
  end
end
