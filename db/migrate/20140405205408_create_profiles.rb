class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :bio
      t.string :location
      t.string :career
    end

    add_index :profiles, :user_id
  end
end
